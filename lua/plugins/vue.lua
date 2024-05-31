return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    ft = { "vue" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "js-debug-adapter")
        end,
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters["pwa-node"] then
        require("dap").adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            -- 💀 Make sure to update this path to point to your installation
            args = {
              require("mason-registry").get_package("js-debug-adapter"):get_install_path()
                .. "/js-debug/src/dapDebugServer.js",
              "${port}",
            },
          },
        }
      end
      if not dap.adapters["pwa-chrome"] then
        require("dap").adapters["pwa-chrome"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "js-debug-adapter",
            args = { "${port}" },
          },
        }
      end
      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }) do
        dap.configurations[language] = {
          {
            -- use nvim-dap-vscode-js's pwa-chrome debug adapter
            type = "pwa-chrome",
            request = "launch",
            -- name of the debug action
            name = "Launch Chrome to debug client side code",
            -- default vite dev server url
            url = "http://localhost:5173",
            -- for TypeScript/Svelte
            sourceMaps = true,
            webRoot = "${workspaceFolder}/src",
            protocol = "inspector",
            port = 9222,
            -- skip files from vite's hmr
            skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
          },
          {
            -- use nvim-dap-vscode-js's pwa-node debug adapter
            type = "pwa-node",
            -- attach to an already running node process with --inspect flag
            -- default port: 9222
            request = "attach",
            -- allows us to pick the process using a picker
            processId = require("dap.utils").pick_process,
            -- name of the debug action
            name = "Attach debugger to existing `node --inspect` process",
            -- for compiled languages like TypeScript or Svelte.js
            sourceMaps = true,
            -- resolve source maps in nested locations while ignoring node_modules
            resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
            -- path to src in vite based projects (and most other projects as well)
            cwd = "${workspaceFolder}/src",
            -- we don't want to debug code inside node_modules, so skip it!
            skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
          },
          language == "javascript" and {
            type = "pwa-node",
            request = "launch",
            name = "Launch file plain node",
            program = "${file}",
            cwd = "${workspaceFolder}",
          } or nil,
          language == "javascript" and {
            type = "pwa-node",
            request = "attach",
            name = "Attach plain node",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          } or nil,
        }
      end
    end,
  },
}

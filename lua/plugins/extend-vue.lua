return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
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
      if not dap.adapters["pwa-chrome"] then
        dap.adapters["pwa-chrome"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              LazyVim.get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
              "${port}",
            },
          },
        }
      end
      dap.configurations["vue"] = {
        {
          -- use nvim-dap-vscode-js's pwa-chrome debug adapter
          type = "pwa-chrome",
          request = "launch",
          -- name of the debug action
          name = "Launch Chrome to debug",
          -- default vite dev server url
          url = "http://localhost:5173",
          -- for TypeScript/Svelte
          sourceMaps = true,
          webRoot = "${workspaceFolder}/src",
          protocol = "inspector",
          port = 9222,
          runtimeExecutable = "/usr/bin/chromium",
          -- -- skip files from vite's hmr
          skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
          userDataDir = false,
        },
        {
          -- use nvim-dap-vscode-js's pwa-chrome debug adapter
          type = "pwa-chrome",
          request = "attach",
          -- name of the debug action
          name = "Attach to Running Chrome",
          -- default vite dev server url
          url = "http://localhost:5173",
          -- for TypeScript/Svelte
          sourceMaps = true,
          webRoot = "${workspaceFolder}/src",
          protocol = "inspector",
          port = 9222,
          -- -- skip files from vite's hmr
          skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
          userDataDir = false,
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            less = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
      },
    },
  },
}

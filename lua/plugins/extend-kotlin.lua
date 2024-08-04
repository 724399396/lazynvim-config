return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      table.insert(dap.configurations.kotlin, {
        type = "kotlin",
        request = "launch",
        name = "This file (app)",
        mainClass = function()
          local root = vim.fs.find("app/src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1] or ""
          local fname = vim.api.nvim_buf_get_name(0)
          -- src/main/kotlin/websearch/Main.kt -> websearch.MainKt
          return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
        end,
        projectRoot = "${workspaceFolder}",
        jsonLogFile = "",
        enableJsonLogging = false,
      })
    end,
  },
}

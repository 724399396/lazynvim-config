return {
  {
    "akinsho/flutter-tools.nvim",
    ft = { "dart" },
    event = { "BufRead pubspec.yaml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>df", "<cmd>FlutterRun<cr>", "Flutter Run" },
      { "<leader>dF", "<cmd>FlutterRestart<cr>", "Flutter Hot Restart" },
    },
    opts = {
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
      },
      outline = { auto_open = false },
      widget_guides = { enabled = true },
      dev_log = { enabled = false, open_cmd = "tabedit" },
      fvm = true,
    },
    lsp = {
      color = {
        enabled = true,
        background = true,
        virtual_text = false,
      },
      settings = {
        showTodos = true,
        renameFilesWithClasses = "prompt",
        enableSnippets = true,
        analysisExcludedFolders = {
          vim.fn.expand("$HOME/.pub-cache"),
          vim.fn.expand("$HOME/fvm"),
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "dart" } },
  },
}

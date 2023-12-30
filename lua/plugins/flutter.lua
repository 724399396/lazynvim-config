return {
  {
    "akinsho/flutter-tools.nvim",
    ft = { "dart" },
    event = { "BufRead pubspec.yaml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>cc", "<cmd>FlutterRun<cr>", "Flutter Run" },
      { "<leader>cr", "<cmd>FlutterReload<cr>", "Flutter Hot Reload" },
      { "<leader>cR", "<cmd>FlutterRestart<cr>", "Flutter Hot Restart" },
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
  },
}

return {
  "vuki656/package-info.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  ft = "json",
  opts = {},
  keys = {
    {
      "<leader>cps",
      function()
        require("package-info").show()
      end,
      desc = "Show package information",
    },
    {
      "<leader>cpd",
      function()
        require("package-info").delete()
      end,
      desc = "Delete package",
    },
    {
      "<leader>cpc",
      function()
        require("package-info").change_version()
      end,
      desc = "Change package version",
    },
    {
      "<leader>cpi",
      function()
        require("package-info").install()
      end,
      desc = "Install package",
    },
  },
}

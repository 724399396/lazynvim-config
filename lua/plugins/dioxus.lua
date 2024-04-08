return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          filetypes_include = { "rust" },
          init_options = {
            rust = "html",
          },
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = { 'class: "(.*)"' },
                includeLanguages = { rust = "html" },
              },
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      log_level = vim.log.levels.TRACE,
      formatters_by_ft = {
        rust = { "dioxus" },
      },
      formatters = {
        dioxus = {
          command = "/home/weili/.cargo/bin/dx",
          args = { "fmt", "--file", "$FILENAME" },
          stdin = false,
          cwd = require("conform.util").root_file({ "Dioxus.toml" }),
          require_cwd = true,
        },
      },
    },
  },
}

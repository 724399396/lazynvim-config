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
}

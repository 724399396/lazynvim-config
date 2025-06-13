return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      mode = "agentic",
      provider = "gemini",
      behavior = {
        auto_apply_diff_after_generation = true,
      },
      providers = {

        gemini = {
          model = "gemini-2.5-pro-preview-06-05",
        },
        aihubmix = {
          api_key_name = "AIHUBMIX_API_KEY",
          model = "llama-3.3-70b-versatile",
        },
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "OPENROUTER_API_KEY",
          model = "openai/gpt-4o-mini",
        },
        grok = {
          __inherited_from = "openai",
          api_key_name = "XAI_API_KEY",
          endpoint = "https://api.x.ai/v1",
          model = "grok-3-beta",
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "echasnovski/mini.icons",
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
    },
    opts = {
      sources = {
        default = {
          "avante",
        },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {},
          },
        },
      },
    },
  },
}

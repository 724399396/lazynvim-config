return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "grok3mini",
      vendors = {
        opquasar = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "openrouter/quasar-alpha",
        },
        op4o = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "openai/gpt-4o-mini",
        },
        opgemini25 = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "google/gemini-2.5-pro-exp-03-25:free",
        },
        opdeepseekv3 = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "deepseek/deepseek-chat-v3-0324:free",
        },
        opdeepseekr1 = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "deepseek/deepseek-r1:free",
        },
        claude37 = {
          __inherited_from = "openai",
          api_key_name = "AIHUBMIX_API_KEY",
          endpoint = "https://aihubmix.com/v1",
          model = "anthropic-3-7-sonnet-20250219",
        },
        grok3mini = {
          __inherited_from = "openai",
          api_key_name = "XAI_API_KEY",
          endpoint = "https://api.x.ai/v1",
          model = "grok-3-mini-beta",
        },
        grok3minifast = {
          __inherited_from = "openai",
          api_key_name = "XAI_API_KEY",
          endpoint = "https://api.x.ai/v1",
          model = "grok-3-mini-fast",
        },
      },
      web_search_engine = {
        provider = "tavily", -- tavily, serpapi, searchapi, google or kagi
      },
    },
    keys = {
      {
        "<leader>aC",
        "<cmd>AvanteClear<cr>",
        desc = "Avante Clear",
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
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
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

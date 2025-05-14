return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub:get_active_servers_prompt()
      end,
      -- Using function prevents requiring mcphub before it's loaded
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
      disabled_tools = {
        "list_files", -- Built-in file operations
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash", -- Built-in terminal access
      },
      provider = "gemini",
      copilot = {
        model = "claude-3.7-sonnet",
        endpoint = "https://api.githubcopilot.com",
        allow_insecure = false,
        timeout = 10 * 60 * 1000,
        temperature = 0,
        max_completion_tokens = 1000000,
        reasoning_effort = "high",
      },
      gemini = {
        api_key_name = "GEMINI_API_KEY",
        model = "gemini-2.5-pro-preview-05-06",
      },
      vendors = {
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "OPENROUTER_API_KEY",
          model = "openai/gpt-4o-mini",
        },
        aihubmix = {
          __inherited_from = "openai",
          api_key_name = "AIHUBMIX_API_KEY",
          endpoint = "https://aihubmix.com/v1",
          model = "anthropic-3-7-sonnet-20250219",
        },
        grok = {
          __inherited_from = "openai",
          api_key_name = "XAI_API_KEY",
          endpoint = "https://api.x.ai/v1",
          model = "grok-3-beta",
        },
        ["gemini_balance"] = {
          __inherited_from = "gemini",
          api_key_name = "GEMINI_API_KEY",
          endpoint = "http://172.10.1.151:8000/gemini/v1beta/models",
          model = "gemini-2.5-pro-preview-05-06",
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
      {
        "ravitemer/mcphub.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
        },
        keys = {
          {
            "<leader>aH",
            "<cmd>MCPHub<cr>",
            desc = "MCPHub",
          },
        },
        -- uncomment the following line to load hub lazily
        --cmd = "MCPHub",  -- lazy load
        build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
        -- uncomment this if you don't want mcp-hub to be available globally or can't use -g
        -- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
        config = function()
          require("mcphub").setup({
            auto_approve = true,
            extensions = {
              avante = {
                make_slash_commands = true, -- make /slash commands from MCP server prompts
              },
            },
          })
        end,
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

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, require("mcphub.extensions.lualine"))
    end,
  },
}

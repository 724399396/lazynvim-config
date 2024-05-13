return {
  {
    "stevearc/overseer.nvim",
    opts = function()
      local overseer = require("overseer")
      overseer.register_template({
        -- Required fields
        name = "PyQt Run",
        builder = function(params)
          -- This must return an overseer.TaskDefinition
          return {
            -- cmd is the only required field
            cmd = { "python" },
            -- additional arguments for the cmd
            args = { "app.py" },
            -- the name of the task (defaults to the cmd of the task)
            name = "PyQt Runner",
            -- set the working directory for the task
            cwd = "./",
          }
        end,
        tags = { overseer.TAG.RUN },
        -- Determines sort order when choosing tasks. Lower comes first.
        priority = 50,
        -- Add requirements for this template. If they are not met, the template will not be visible.
        -- All fields are optional.
        condition = {
          -- A string or list of strings
          -- Only matches when current buffer is one of the listed filetypes
          filetype = { "python" },
        },
      })
    end,
    keys = {
      {
        "<leader>rr",
        function()
          vim.cmd("OverseerRun")
        end,
        desc = "Run Task",
      },
      {
        "<leader>rs",
        function()
          vim.cmd("OverseerToggle")
        end,
        desc = "Overseer Toggle",
      },
      {
        "<leader>ra",
        function()
          vim.cmd("OverseerTaskAction")
        end,
        desc = "Overseer Task Action",
      },
    },
  },
}

return {
  {
    "jbyuki/one-small-step-for-vimkind",
    keys = {
      {
        "<leader>ddL",
        function()
          require("osv").launch({ port = 8086 })
        end,
        desc = "Adapter Lua Server",
      },
    },
  },
}

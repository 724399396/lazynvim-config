return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      opts.settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-1.8",
                path = "/usr/lib/jvm/java-8-openjdk/",
              },
              {
                name = "JavaSE-11",
                path = "/usr/lib/jvm/java-11-openjdk/",
              },
              {
                name = "JavaSE-17",
                path = "/usr/lib/jvm/java-17-openjdk/",
              },
            },
          },
        },
      }
    end,
  },
}

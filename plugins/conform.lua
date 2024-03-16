return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "isort", "black" },
        ["terraform"] = { "terraform_fmt" },
      },
      formatters = {
        black = {
          prepend_args = { "-S", "--fast" },
        },
      },
    },
  },
}

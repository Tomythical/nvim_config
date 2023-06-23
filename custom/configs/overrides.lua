local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "yaml",
    "python",
    "terraform",
    "bash",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- bash stuff
    "shellcheck",
    "shellharden",

    -- python stuff
    "ruff",
    "pylyzer",
    "black",
    "mypy",
    "isort",

    -- terraform stuff
    "terraform-ls",

    -- yaml stuff
    "yaml-language-server",
    "yamllint",

    -- other stuff
    "codespell"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M

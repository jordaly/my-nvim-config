local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "python",
    "htmldjango",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "dockerfile",
    "terraform",
    "comment",
    "json",
    "yaml",
    "dockerfile",
    "bash",
    "c_sharp",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python",
    -- },
  },
  highlight = {
    enable = true,
    disable = {
      -- "python"
      "htmldjango",
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
-- M.treesitter.parser_config = parser_config

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "emmet-language-server",
    "deno",
    "prettier",

    -- python stuff
    "pyright",
    "mypy",
    "ruff",
    "black",
    "djlint",
    "python-lsp-server",
    "omnisharp",
    "omnisharp-mono",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- devops stuff
    "dockerfile-language-server",
    "docker-compose-language-service",
    "terraform-ls",
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

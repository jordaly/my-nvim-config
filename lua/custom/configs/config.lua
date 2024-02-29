local opts = require "nvchad.options"

vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.ssop = "globals,resize,winpos,winsize,tabpages,buffers,blank,curdir,folds,help,options,tabpages,terminal"
-- sessionoptions+=globals,resize,winpos,winsize,tabpages,buffers,curdir,folds,help,options,tabpages,terminal
-- vim.o.ssop+=globals,resize,winpos,winsize,tabpages,buffers,curdir,folds,help,options,tabpages,terminal

-- Define your custom keybindings
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })

-- Configure plugins using the packer.nvim plugin manager
require("packer").startup(function()
  -- Add your plugin configurations here
  use "tpope/vim-surround"
  use "neovim/nvim-lspconfig"
  use "sheerun/vim-polyglot"
  -- ...
end)

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.razor = {
  install_info = {
    url = "~/tree-sitter-razor", -- URL of the tree-sitter-razor repository
    files = { "src/parser.c" },
    branch = "master", -- or use the appropriate branch
  },
  filetype = "cshtml", -- Use "cshtml" as the Razor filetype
}
opts.options = {
  -- Configure your NvChad-specific options here
}

return opts

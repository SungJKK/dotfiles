-- Sung's nvim lua config

-- TODO: Create cheatsheet for keybindings

-- TODO: add emmet
-- TODO: Polish lsp/init.lua (lspconfig & lspsaga & fix lsp keybindings & fix lspsaga code actions & automate lsp install)
-- TODO: Add more features to LSP (auto formatting, compe, snippets, etc)

-- TODO: Add optional extra plugins

-- TODO: fix Truezen bar toggle on / off
-- TODO: Clean config files, use global variables
-- TODO: Set global variables to configure

-- Global variables
CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

-- Vimscript functions
vim.cmd('source '..CONFIG_PATH..'/vimscript/functions.vim')

-- General Settings
require('settings')
require('keymappings')
require('plugins')

-- Plugin settings
require('barbar-conf')
require('nvim-tree-conf')
require('colorscheme')
require('dashboard-conf')
require('galaxyline-conf')
require('which-key-conf')

require('telescope-conf')

require('treesitter-conf')
require('vim-matchup-conf')

require('symbols-outline-conf')

require('comment-conf')
require('compe-conf')

require('gitsigns-conf')
require('gitblame-conf')

require('fterm-conf')
require('todo-comments-conf')
require('truezen-conf')


-- LSP
require('lsp')

require('lsp.html-ls')
require('lsp.css-ls')
require('lsp.js-ts-ls')
require('lsp.graphql-ls')

require('lsp.bash-ls')

require('lsp.python-ls')

require('lsp.haskell-ls')

require('lsp.lua-ls')

require('lsp.cmake-ls')
require('lsp.clangd-ls')

require('lsp.docker-ls')
require('lsp.yaml-ls')
require('lsp.json-ls')

require('lsp.vim-ls')
require('lsp.latex-ls')


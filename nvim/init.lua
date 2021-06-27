-- Sung's nvim lua config

-- TODO: add snippets & linters & autoformat
-- TODO: add latex snippets && preview

-- TODO: clean config files & plugins, use global variables
-- TODO: optimize start time / nvim

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

require('trouble-conf')
require('telescope-conf')

require('treesitter-conf')
require('vim-matchup-conf')

require('symbols-outline-conf')
require('numb-conf')

require('comment-conf')
require('compe-conf')
require('neoformat-conf')

require('gitsigns-conf')
require('gitblame-conf')
require('diffview-conf')
require('octo-conf')

require('colorizer-conf')
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

require('lsp.go-ls')

require('lsp.lua-ls')

require('lsp.cmake-ls')
require('lsp.clangd-ls')

require('lsp.docker-ls')
require('lsp.yaml-ls')
require('lsp.json-ls')

require('lsp.vim-ls')
require('lsp.latex-ls')


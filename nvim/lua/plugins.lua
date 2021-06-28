-- Ensure that packer is installed on any machine.
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Auto compile when plugins.lua is changed
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

-- Packages
return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'glepnir/lspsaga.nvim'
  use 'kabouzeid/nvim-lspinstall'
  use 'folke/lsp-colors.nvim'
  use 'folke/trouble.nvim'

  -- QuickFix
  use 'kevinhwang91/nvim-bqf'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use 'windwp/nvim-ts-autotag'
  use 'andymass/vim-matchup'

  -- Autocomplete, Snippets, Format
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use 'sbdchd/neoformat'

  -- Coding
  use {'fatih/vim-go', run = ':GoUpdateBinaries'}
  use 'tpope/vim-surround'
    -- use 'blackCauldron7/surround.nvim' (beta)
  use 'ludovicchabant/vim-gutentags'
  use 'simrat39/symbols-outline.nvim'
  use 'folke/todo-comments.nvim'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
    -- use 'davidgranstrom/nvim-markdown-preview' (beta)
    -- use 'jghauser/follow-md-links.nvim' (beta)
  use 'numtostr/FTerm.nvim'

  -- Comments
  use "terrortylor/nvim-comment"
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Debugging
  -- use 'mfussenegger/nvim-dap'
  -- use 'rcarriga/nvim-dap-ui' (beta)

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'f-person/git-blame.nvim'
  -- use 'TimUntersberger/neogit' (beta)
  use 'sindrets/diffview.nvim'
  use 'pwntester/octo.nvim'

  -- Productivity
  use 'jbyuki/nabla.nvim'
  -- use 'vhyrro/neorg' (beta)
  -- use 'kristijanhusak/orgmode.nvim'
  use 'Pocco81/TrueZen.nvim'
  use 'soywod/unfog.vim'

  -- Utilities
  use 'nacro90/numb.nvim'
  use 'glepnir/dashboard-nvim'
  use 'folke/which-key.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-telescope/telescope-symbols.nvim'

  -- Colorschemes
  use 'shaunsingh/moonlight.nvim'
  use 'folke/tokyonight.nvim'
  use 'christianchiarulli/nvcode-color-schemes.vim'

  -- Syntax
  use 'MTDL9/vim-log-highlighting'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Dashboard, Explorer, Statusline, Bufferline
  use 'kyazdani42/nvim-tree.lua'
  use 'ahmedkhalf/lsp-rooter.nvim'

  use 'glepnir/galaxyline.nvim'
  use 'romgrk/barbar.nvim'
end)


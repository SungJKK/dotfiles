" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    \ autocmd VimEnter * PlugInstall
    \ autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/archive-plugins')
    " ==> Programming
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
    Plug 'preservim/tagbar'
    Plug 'mattn/emmet-vim'
    Plug 'preservim/nerdcommenter'                              
    Plug 'junegunn/vim-easy-align'
    
    " ==> Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'bfrg/vim-cpp-modern'
    Plug 'ekalinin/Dockerfile.vim'
    Plug 'mtdl9/vim-log-highlighting'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'elzr/vim-json'
    Plug 'stephpy/vim-yaml'

    Plug 'neovimhaskell/haskell-vim'
    Plug 'itchyny/vim-haskell-indent'
    Plug 'luochen1990/rainbow'

    " ==> Git integration
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'

    " ==> Writing & Notes
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'vimwiki/vimwiki'
    Plug 'mattn/calendar-vim'

    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'lervag/vimtex'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    " ==> Task Management
    Plug 'wsdjeg/vim-todo'

    " ==> Utilities
    Plug 'mhinz/vim-startify'
    Plug 'liuchengxu/vim-which-key'                             
    Plug 'tpope/vim-surround'                                   
    Plug 'dhruvasagar/vim-table-mode'                           
    Plug 'norcalli/nvim-colorizer.lua'                         

    " ==> File Explorers
    Plug 'kevinhwang91/rnvimr'                                
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " ==> Nvim themes
    Plug 'luochen1990/rainbow'
    Plug 'tomasiser/vim-code-dark'
    Plug 'romgrk/doom-one.vim'
    
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

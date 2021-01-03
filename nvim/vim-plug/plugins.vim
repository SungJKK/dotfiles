" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " Programming
    Plug 'mattn/emmet-vim'

    " Utilities
    Plug 'preservim/nerdcommenter'                              " easy commenting multi-lines
    Plug 'tpope/vim-surround'                                   " easy surrounding words 
    Plug 'kevinhwang91/rnvimr'                                  " ranger file viewer
    Plug 'norcalli/nvim-colorizer.lua'                          " color 
    Plug 'liuchengxu/vim-which-key'                             " show key bindings (which key)
    Plug 'voldikss/vim-floaterm'                                " vim floaterm

    " fuzzy file search 
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

    " git integration 
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'

    " Stable version of coc 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    Plug 'luochen1990/rainbow'

    " Vim Colorschemes 
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Vim Airline 
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " vim glyphs
    Plug 'ryanoasis/vim-devicons'       
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    \ autocmd VimEnter * PlugInstall
    \ autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/archive-plugins')
    " ==> Programming
    Plug 'mattn/emmet-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdcommenter'                              

    " ==> Git integration
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'

    " ==> Utilities
    " Plug 'liuchengxu/vim-which-key'                             
    Plug 'vimwiki/vimwiki'
    Plug 'mhinz/vim-startify'
    Plug 'tpope/vim-surround'                                   
    Plug 'dhruvasagar/vim-table-mode'                           
    Plug 'norcalli/nvim-colorizer.lua'                         

    " ==> File explorers
    Plug 'kevinhwang91/rnvimr'                                

    " fuzzy file search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " ==> Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    Plug 'luochen1990/rainbow'
    
    " ==> Vim Colorschemes
    Plug 'luochen1990/rainbow'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'tomasiser/vim-code-dark'
    Plug 'rakr/vim-one'
    
    " ==> Vim Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " ==> Vim glyphs
    Plug 'ryanoasis/vim-devicons'
call plug#end()

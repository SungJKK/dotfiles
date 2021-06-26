" Specify a directory for plugins
call plug#begin('~/.vim/archive-plugins')
  " Basic syntaxsupport
  Plug 'sheerun/vim-polyglot'
  Plug 'MTDL9/vim-log-highlighting'
  Plug 'luochen1990/rainbow'

  " Basic functionality
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Vim UI
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-airline/vim-airline'
call plug#end()

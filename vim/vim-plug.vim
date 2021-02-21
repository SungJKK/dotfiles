" Specify a directory for plugins
call plug#begin('~/.vim/archive-plugins')
  " Utilities
  Plug 'preservim/nerdtree'
  Plug 'PhilRunninger/nerdtree-visual-selection'

  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'

  Plug 'dhruvasagar/vim-table-mode'
  Plug 'etdev/vim-hexcolor'

  " Git
  Plug 'mhinz/vim-signify'

  " Syntax support
  Plug 'kovetskiy/vim-bash'
  Plug 'vim-perl/vim-perl'
  Plug 'sheerun/vim-polyglot'

  Plug 'luochen1990/rainbow'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " Vim UI
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'tomasiser/vim-code-dark'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-airline/vim-airline'
call plug#end()

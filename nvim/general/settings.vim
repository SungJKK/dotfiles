
syntax enable                           " Enables syntax highlighing
syntax on
filetype plugin indent on

set termguicolors
set hidden                              " Required to keep multiple buffers open multiple buffers
set encoding=UTF-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			        " Show the cursor position all the time
" set nowrap                              " Don't wrap lines
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set t_ut=
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set number                              " Line numbers
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set nofoldenable                        " disable folding
autocmd FileType * set formatoptions-=cro                  " Stop newline continution of comments

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" File specific syntax
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


" Disable audible & visual bells
set noerrorbells
set novisualbell
set t_vb=

" Set character between vertical window splits
set fillchars=vert:.

" Set backup files directory
set backup
if !isdirectory($HOME.'/.config/nvim/.archive_bak') && exists('*mkdir')
  call mkdir($HOME.'/.config/nvim/.archive_bak')
endif
set backupdir^=$HOME/.vim/.archive_bak//

" Set swap files directory
if !isdirectory($HOME.'/.config/nvim/.archive_swp') && exists('*mkdir')
  call mkdir($HOME.'/.config/nvim/.archive_swp')
endif
set directory^=$HOME/.vim/.archive_swp//





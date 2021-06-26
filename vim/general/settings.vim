
syntax enable                           " Enables syntax highlighing
syntax on
filetype plugin indent on

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
autocmd FileType * set formatoptions-=cro                  " Stop newline continution of comments

" Disable audible & visual bells
set noerrorbells
set novisualbell
set t_vb=

" Set character between vertical window splits
set fillchars=vert:.

" Cursor mode settings
let &t_SI.="\e[5 q"   "SI = INSERT mode
let &t_SR.="\e[4 q"   "SR = REPLACE mode
let &t_EI.="\e[2 q"   "EI = NORMAL mode (ELSE)

" Disable .viminfo file
let skip_defaults_vim=1
set viminfo=""
set viminfofile=NONE

" Set swap files directory
if !isdirectory($HOME.'/.vim/archive-swap') && exists('*mkdir')
  call mkdir($HOME.'/.vim/archive-swap')
endif
set directory^=$HOME/.vim/archive-swap//





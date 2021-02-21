" Initial window size
let NERDTreeWinSize = 25
let g:NERDTreeMinimalUI = 1

" Open NerdTree when entering vim, and put cursor in file
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Show dotfiles
let NERDTreeShowHidden = 1


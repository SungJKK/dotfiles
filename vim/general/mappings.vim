" set leader key
nnoremap <SPACE> <Nop>
let g:mapleader = "\<SPACE>"

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window splitting
nnoremap <leader>v :vsp<CR>
nnoremap <leader>h :sp<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
execute "set <M-j>=\ej"         
execute "set <M-k>=\ek"         
execute "set <M-h>=\eh"         
execute "set <M-l>=\el"         
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Close current buffer
nnoremap <S-c> :bp<bar>bd#<CR>

" Show macros with <space> + m
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Toggle NerdTree using <space> + e
nnoremap <leader>e :NERDTreeToggle<CR>

" Toggle fzf (find files)
nnoremap <leader>ff :Files<CR>

" Toggle ripgrep (find string)
nnoremap <leader>fr :Rg<CR>

" Find buffers
nnoremap <leader>ft :Buffers<CR>

" Lines in current / all buffer
nnoremap <leader>fc :BLines<CR>
nnoremap <leader>fb :Lines<CR>



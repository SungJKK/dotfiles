" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <jk> <C-\><C-n>
tnoremap <kj> <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on t + t
function! OpenTerminal()
  split term://bash
  resize 10
endfunction

nnoremap <c-n> :call OpenTerminal()<CR>

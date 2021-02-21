" quickly enable / disable table mode in insert mode by using || 
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
      \ <SID>isAtStartOfLine('\|\|') ?
      \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'

" use '+' as table corners
let g:table_mode_corner_corner='+'

" use <leader>tdd to delete row 
let g:table_mode_delete_row_map = 1
" use <leader>tdc to delete col
let g:table_mode_delete_column_map = 1
" use <leader>tic to insert col
let g:table_mode_insert_column_after_map = 1


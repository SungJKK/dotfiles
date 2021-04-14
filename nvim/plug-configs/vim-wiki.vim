
" Disable folding
let g:vimwiki_folding = ''

" Disable every markdown file being treated as vimwiki
let g:vimwiki_global_ext = 0

" Using vimwiki syntax
let g:vimwiki_ext2syntax = {'.wiki': 'markdown'}

let g:vimwiki_list = [{
      \ 'path': '~/vimwiki/',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'auto_tags': 1,
      \ 'auto_diary_index': 1,
      \ 'auto_generate_links': 1,
      \ 'auto_generate_tags': 1
      \ }]


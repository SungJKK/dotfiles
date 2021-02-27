
" convert all wiki pages into html
nnoremap <space>cv :VimwikiAll2HTML<CR>

let g:vimwiki_ext2syntax = {'.wiki': 'markdown'}

let g:vimwiki_list = [{
      \ 'path': '~/vimwiki/',
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'custom_wiki2html': '~/vimwiki/utils/convert.py',
      \ 'path_html': '~/vimwiki/html',
      \ 'css_name': 'css/style.css'
      \ }]



" Disable folding
let g:vimwiki_folding = ''

" Using vimwiki syntax
let g:vimwiki_ext2syntax = {'.wiki': 'markdown'}

" For code syntax in html conversion
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script'

let g:vimwiki_list = [{
      \ 'path': '~/vimwiki/',
      \ 'syntax': 'default',
      \ 'ext': '.wiki',
      \ 'path_html': '~/vimwiki/wiki_html',
      \ 'template_path': '~/vimwiki/templates',
      \ 'template_default': 'index_template',
      \ 'template_ext': '.html',
      \ 'auto_tags': 1,
      \ 'auto_diary_index': 1,
      \ 'auto_generate_links': 1,
      \ 'auto_generate_tags': 1
      \ }]


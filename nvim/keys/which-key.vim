
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Define a separator
let g:which_key_sep = '→'

" Set timeout length to show
set timeoutlen=400

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_position = 'botright'

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Create map to add keys to
let g:which_key_map =  {}

" ignore showing these mappings
let g:which_key_map['rn'] = 'which_key_ignore'
let g:which_key_map['a'] = 'which_key_ignore'
let g:which_key_map['ac'] = 'which_key_ignore'
let g:which_key_map['hp'] = 'which_key_ignore'
let g:which_key_map['tt'] = 'which_key_ignore'
let g:which_key_map['c'] = { 'name': 'which_key_ignore' }

" ignore non-top level mappings
let g:which_key_map['_'] = { 'name': 'which_key_ignore' }

" Single mappings
let g:which_key_map['s'] = [ ':w'                         , 'save file' ]
let g:which_key_map['m'] = [ ':registers'                 , 'show macros' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right' ]
let g:which_key_map[','] = [ ':Emmet'                     , 'emmet'  ]
let g:which_key_map['g'] = [ ':Goyo'                      , 'goyo' ]
let g:which_key_map['c'] = [ ':CalendarT'                 , 'open_calendar' ]
let g:which_key_map['l'] = [ '<Plug>(EasyAlign)'          , 'easy_align' ]
let g:which_key_map['d'] = [ ':OpenTodo'                  , 'todo' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'coc explorer' ]
let g:which_key_map['a'] = [ ':TagbarToggle'              , 'tagbar' ]
let g:which_key_map['r'] = [ ':RnvimrToggle'              , 'vim ranger' ]
let g:which_key_map['t'] = [ ':FloatermToggle'            , 'floatterm' ]

" Group mappings

let g:which_key_map['p'] = {
      \ 'name' : '+live_preview' ,
      \ 'm' : [ ':MarkdownPreview'     , 'markdown preview' ],
      \ 'l' : [ ':LLPStartPreview'     , 'latex preview' ]
      \ }

let g:which_key_map['f'] = {
      \ 'name' : '+fzf',
      \ 'f' : [ ':FZF'                    , 'fuzzy finder' ],
      \ 'g' : [ ':GFiles'                 , 'git files' ],
      \ 'm' : [ ':Commits'                , 'git commits' ],
      \ 'b' : [ ':Buffers'                , 'buffers' ],
      \ 'c' : [ ':Colors'                 , 'colorschemes' ],
      \ 'l' : [ ':Lines'                  , 'buffer lines' ],
      \ 't' : [ ':Tags'                   , 'project tags' ]
      \ }

let g:which_key_map['w'] = {
            \ 'name': '+vim_wiki' ,
            \ 'w': [ ':VimwikiIndex'                  , 'wiki_index' ],
            \ 's': [ ':VimwikiUISelect'               , 'wiki_UI_select' ],
            \ 'i': [ ':VimwikiDiaryIndex'             , 'wiki_diary_index' ],
            \ 'd': [ ':VimwikiDeleteFile'             , 'delete_wiki_file' ],
            \ 'r': [ ':VimwikiRenamefile'             , 'rename_wiki_file' ],
            \ 'n': [ ':VimwikiGoto'                   , 'goto_or_create_wiki' ],
            \ 'l': [ ':VimwikiToggleListItem'         , 'toggle_list_item' ],
            \ 'g': [ ':VimwikiGenerateLinks'          , 'wiki_gen_links' ],
            \ 't': [ ':VimwikiTOC'                    , 'gen_toc' ],
            \ }

" Register which key maps 
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>



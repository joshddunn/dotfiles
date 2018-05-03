" surround
vmap Si S(i_<esc>f)

" lightline
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'statusline', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'statusline': '%{fugitive#statusline()}'
  \ },
\ }

" yankstack
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

" vim-multiple-cursors
let g:multi_cursor_start_word_key = '<C-s>'
let g:multi_cursor_next_key = '<C-s>'
let g:multi_cursor_quit_key = '<Esc>'

" ctrlp
" let g:ctrlp_working_path_mode = 0

" let g:ctrlp_map = '<c-f>'
" map <leader>j :CtrlP<cr>
" map <c-b> :CtrlPBuffer<cr>

" let g:ctrlp_max_height = 20

" if executable('rg')
"   set grepprg=rg\ --color=never
"   let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
"   let g:ctrlp_use_caching = 0
" endif

" fzf
map <leader>j :Files<cr>
map <c-f> :Files<cr>
let g:fzf_tags_command = 'ctags -R'
let g:fzf_buffers_jump = 1

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" nerdtree
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case --glob "!node_modules/**" --glob "!package-lock.json"'
endif

map <leader>g :Ack -F ""<Left>

" colorscheme
" line 558 change color from Normal to GruvboxBlue
set background=dark
try
  colorscheme gruvbox
catch
endtry

" youcompleteme
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#444444

" surround
" # 35
autocmd FileType ruby let b:surround_35 = "<%# \r %>"
" - 45
autocmd FileType ruby let b:surround_45 = "<% \r -%>"
" = 61
autocmd FileType ruby let b:surround_61 = "<%= \r %>"

" vim-rails
let g:rails_custom_singularize = {
  \   'moves': 'move', 
  \   'metas': 'metum',
  \   'data': 'datum', 
\ }

let g:rails_custom_pluralize = {
\ }

" markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_hotkey='<C-m>'

" trigger abolish
inoremap _ <C-]>_
inoremap - <C-]>-

" anyfold
let anyfold_activate=1
set foldlevel=99

" jsx
let g:jsx_ext_required = 0

" node
set runtimepath^=~/.vim/bundle/node 

" javascript
let g:javascript_plugin_flow = 1

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" deoplete (neovim)
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

highlight Pmenu ctermbg=239 guibg=#504945

" neosnippet
let g:neosnippet#enable_completed_snippet = 1

" vim-markdown
let g:vim_markdown_new_list_item_indent = 0

" git gutter
let g:gitgutter_enabled = 0

" vim-quick-command
let g:vim_quick_command_default_terminal = "Fish"
let g:vim_quick_command_alias = { "rails": "docker-compose run web rails" }

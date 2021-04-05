" vim-glob
let g:glob_ignore = {
  \ "shared": [
  \   "**/node_modules/**",
  \   ".git/**",
  \   ".bundle/**",
  \   "__*/**",
  \   "tmp/**",
  \   "**/*.class",
  \   "_build/**",
  \   "deps/**",
  \   "assets/node_modules/**",
  \   "priv/static/**",
  \   "modules/**",
  \ ],
  \ "files": [
  \ ],
  \ "global": [
  \   "package-lock.json",
  \   "Gemfile.lock",
  \   "tags",
  \ ]
\ }

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'base16_tomorrow'

" yankstack
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

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

let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow ' . glob#ignore('files')
let g:fzf_command_prefix = 'Fzf'
map <leader>b :FzfBuffers<cr>

" nerdtree
" let g:NERDTreeWinPos = "right"
" let NERDTreeShowHidden=0
" let g:NERDTreeWinSize=50
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark<Space>
" map <leader>nf :NERDTreeFind<cr>

" nvim-tree
map <leader>nn :NvimTreeToggle<CR>
map <leader>nf :NvimTreeFindFile<CR>
let g:nvim_tree_side = 'right'
let g:nvim_tree_width = 50

let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': ""
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

" ack
if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case ' . glob#ignore('global')
endif

map <leader>g :Ack -F -- ""<Left>

" colorscheme
" line 558 change color from Normal to GruvboxBlue
set background=dark
try
  colorscheme base16-tomorrow-night
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

" trigger abolish
inoremap _ <C-]>_
inoremap - <C-]>-
let g:abolish_save_file = expand('~/.config/nvim/after/plugin/abolish.vim')

" anyfold
autocmd Filetype * AnyFoldActivate
set foldlevel=99

" jsx
let g:jsx_ext_required = 0

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" deoplete (neovim)
" let g:deoplete#enable_at_startup = 0
" autocmd InsertEnter * call deoplete#enable()
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

let g:coc_global_extensions = [
\ ]

let g:OmniSharp_server_use_mono = 1

highlight Pmenu ctermbg=239 guibg=#504945

" git gutter
let g:gitgutter_enabled = 0

" vim-rails-singularize
let g:rails_singularize = {
  \  'moves': 'move',
  \  'metas': 'metum',
  \  'data': 'datum',
\ }

let g:rails_pluralize = {}

" ale
let g:ale_fix_on_save = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_linters = {
  \ 'elixir': [],
  \ 'cs': ['OmniSharp'],
\ }

" syntastic
let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "passive_filetypes": ["ex", "exs"]
\ }

" easy align
xmap ga <Plug>(EasyAlign)
xmap gax <Plug>(EasyAlign)<c-x>
nmap ga <Plug>(EasyAlign)
nmap gax <Plug>(EasyAlign)ip<c-x>

" tmux-airline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
  \ 'left':      '',
  \ 'left_alt':  '❯',
  \ 'right':     '',
  \ 'right_alt': '❮',
  \ 'space':     ' '}

" search highlighting
highlight Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline

" github link use GH and GB
let g:gh_line_map_default = 0
let g:gh_line_blame_map_default = 0
let g:gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '
let g:gh_use_canonical = 0

" vim-sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S
let g:sneak#s_next = 1

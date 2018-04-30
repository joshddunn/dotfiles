" folding
set foldmethod=marker

" backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

" map leader key
let g:mapleader = ","

" autoread
set autoread

" command bar height
set cmdheight=2

" show current position
set ruler

" searching
set hlsearch
set smartcase
set ignorecase

" show matching bracket
set showmatch
set mat=2

" stop the sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" remove scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Relative line numbering
set relativenumber
set number 

" Color column can be set for different filetypes
highlight ColorColumn ctermbg=0
autocmd FileType python setlocal colorcolumn=79

" set default font
set encoding=utf8
set guifont=Menlo:h12
set ffs=unix,dos,mac

" no backups
set nobackup
set nowb
set noswapfile

" padding when using j/k
set so=7

" search / and backward search ?
map <space> /
map <c-space> ?

" remove search highlight
map <silent> <leader><cr> :noh<cr>

" windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" command key tab navigation
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 0gt

" undo everything
set undodir=~/.config/nvim/temp/undodir
set undofile

" tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai " auto indent
set si " smart indent
set wrap " wrap lines

" always show last status
set laststatus=2

" show tabs by default
set switchbuf=useopen,usetab,newtab
set stal=2

" shellpipe
set shellpipe=>

" copy to clipboard
vnoremap  <leader>y "+y
nnoremap  <leader>Y "+yg_
nnoremap  <leader>y "+y
nnoremap  <leader>yy "+yy

" paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" list chars
set list listchars=trail:·

let g:vim_rsync = {
\ "remote": {
\   "mtgql": {
\     "user": "root",
\     "ip_address": "",
\     "local_directory": "",
\     "remote_directory": "",
\     "exclude": [
\     ]
\   },
\ }
\}

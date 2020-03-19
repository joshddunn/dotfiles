" python
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/Cellar/python/3.7.7/bin/python3'

" backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

" map leader and localleader keys
let mapleader = ","
let maplocalleader = "\\"

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

" open below
set splitbelow
set splitright

" Relative line numbering
set relativenumber
set number

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
vmap <space> y/<C-r>0<cr><S-n>
map <c-s> yiw/<C-r>0<cr><S-n>cgn
vmap <c-s> y/<C-r>0<cr><S-n>cgn
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

"
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2 sts=4

" always show last status
set laststatus=2

" shellpipe
set shellpipe=>

" copy to clipboard
vnoremap  <leader>y "+y
nnoremap  <leader>Y "+yg_
nnoremap  <leader>y "+y

" paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" ctags command
command! Ctags exe '!ctags -R .'

" fix tabs
command! Tab exe 'set tabstop=2 shiftwidth=2 | retab'

" move between buffers
nmap <Tab> :NERDTreeClose<cr>:bn<cr>
nmap <S-Tab> :NERDTreeClose<cr>:bp<cr>

" remove trailing whitespace
autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e

" makes files hidden instead of closed when switching buffers
set hidden

" set filetypes
autocmd BufNewFile,BufRead *.html.inky   set syntax=html.erb

" bufdelete
function! BufDelete(operator)
  " can use v:val.name to get names of files
  let buffers = map(filter(copy(getbufinfo()), 'v:val.listed && v:val.bufnr ' . a:operator . ' ' . bufnr('%')), 'v:val.bufnr')
  if len(buffers) > 0
    for i in buffers
      exe i . 'bd'
    endfor
  endif
endfunction

command! BufOnly call BufDelete('!=')
command! BufAfter call BufDelete('>')
command! BufBefore call BufDelete('<')

" for base 16 colorscheme
let base16colorspace=256
set termguicolors

" run love2d game
command! Love exe 'silent !/Applications/love.app/Contents/MacOS/love .'
noremap ,l :Love<cr>

" search word under cursor
function! SearchSelection(args)
  exe 'Ack -F -- "' . a:args . '"'
endfunction
command! -bang -nargs=1 SearchSelection call SearchSelection(<q-args>)

map <leader>G yiw:SearchSelection <C-r>0<cr>
vmap <leader>G y:SearchSelection <C-r>0<cr>

" no modelines
set modelines=0
set nomodeline

" global find replace
function! GlobalReplace(old, new)
  exe "!rg -l '". a:old . "' . | xargs perl -pi -e 's/" . a:old . "/" . a:new . "/g'"
  echo "All done."
endfunction
command! -bang -nargs=* GlobalReplace call GlobalReplace(<f-args>)

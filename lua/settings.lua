local utils = require("utils")

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
vim.g.base16colorspace = 256

vim.g.python_host_prog = os.getenv("HOME") .. "/.asdf/shims/python2"
vim.g.python3_host_prog = os.getenv("HOME") .. "/.asdf/shims/python3"

vim.api.nvim_command("set whichwrap+=<,>,h,l,[,]")
vim.api.nvim_command("set guioptions-=r")
vim.api.nvim_command("set guioptions-=R")
vim.api.nvim_command("set guioptions-=l")
vim.api.nvim_command("set guioptions-=L")
vim.api.nvim_command("set t_vb=")

utils.opt("o", "backspace", "eol,start,indent")
utils.opt("o", "autoread", true)
utils.opt("o", "cmdheight", 2)
utils.opt("o", "ruler", true)
utils.opt("o", "hlsearch", true)
utils.opt("o", "smartcase", true)
utils.opt("o", "ignorecase", true)
utils.opt("o", "showmatch", true)
utils.opt("o", "matchtime", 2)
utils.opt("o", "errorbells", false)
utils.opt("o", "visualbell", false)
utils.opt("o", "timeoutlen", 500)
utils.opt("o", "splitbelow", true)
utils.opt("o", "splitright", true)
utils.opt("w", "relativenumber", true)
utils.opt("w", "number", true)
utils.opt("o", "encoding", "utf8")
utils.opt("o", "guifont", "Menlo:h12")
utils.opt("o", "fileformats", "unix,dos,mac")
utils.opt("o", "backup", false)
utils.opt("o", "writebackup", false)
utils.opt("b", "swapfile", false)
utils.opt("o", "scrolloff", 7)
utils.opt("o", "undodir", os.getenv("HOME") .. "/.config/nvim/temp/undodir")
utils.opt("b", "undofile", true)
utils.opt("b", "expandtab", true)
utils.opt("o", "smarttab", true)
utils.opt("b", "shiftwidth", 2)
utils.opt("b", "tabstop", 2)
utils.opt("b", "autoindent", true)
utils.opt("b", "smartindent", true)
utils.opt("w", "wrap", true)
utils.opt("o", "laststatus", 2)
utils.opt("o", "shellpipe", ">")
utils.opt("o", "hidden", true)
utils.opt("o", "termguicolors", true)
utils.opt("o", "modelines", 0)
utils.opt("b", "modeline", false)
utils.opt("w", "foldlevel", 99)
utils.opt("o", "background", "dark")

vim.api.nvim_command("autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2 sts=4")
vim.api.nvim_command("command! Ctags exe '!ctags -R .'")
vim.api.nvim_command("command! Tab exe 'set tabstop=2 shiftwidth=2 | retab'")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.html.inky   set syntax=html.erb")

-- trailing whitespace
vim.api.nvim_command("autocmd FileType * autocmd BufWritePre <buffer> %s/\\s\\+$//e")

-- bufdelete
vim.api.nvim_command([[
  function! BufDelete(operator)
    " can use v:val.name to get names of files
    let buffers = map(filter(copy(getbufinfo()), 'v:val.listed && v:val.bufnr ' . a:operator . ' ' . bufnr('%')), 'v:val.bufnr')
    if len(buffers) > 0
      for i in buffers
        exe i . 'bd'
      endfor
    endif
  endfunction
]])

vim.api.nvim_command("command! BufOnly call BufDelete('!=')")
vim.api.nvim_command("command! BufAfter call BufDelete('>')")
vim.api.nvim_command("command! BufBefore call BufDelete('<')")

-- search selection
vim.api.nvim_command([[
  function! SearchSelection(args)
    exe 'Ack -F -- "' . a:args . '"'
  endfunction
  command! -bang -nargs=1 SearchSelection call SearchSelection(<q-args>)
]])

utils.map("", "<leader>G", "yiw:SearchSelection <C-r>0<cr>", nil)
utils.map("v", "<leader>G", "y:SearchSelection <C-r>0<cr>", nil)

-- global replace
vim.api.nvim_command([[
  function! GlobalReplace(old, new)
    exe "!rg -l '". a:old . "' . | xargs perl -pi -e 's/" . a:old . "/" . a:new . "/g'"
    echo "All done."
  endfunction
]])

vim.api.nvim_command("command! -bang -nargs=* GlobalReplace call GlobalReplace(<f-args>)")

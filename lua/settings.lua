local lib = require("lib")

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

vim.o.autoread = true
vim.o.background = "dark"
vim.o.backspace = "eol,start,indent"
vim.o.backup = false
vim.o.cmdheight = 2
vim.o.encoding = "utf8"
vim.o.errorbells = false
vim.o.fileformats = "unix,dos,mac"
vim.o.guifont = "Menlo:h12"
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.laststatus = 2
vim.o.matchtime = 2
vim.o.modelines = 0
vim.o.ruler = true
vim.o.scrolloff = 7
vim.o.shellpipe = ">"
vim.o.showmatch = true
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.smarttab = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/temp/undodir"
vim.o.visualbell = false
vim.o.writebackup = false

vim.o.autoindent = true
vim.bo.autoindent = true

vim.o.expandtab = true
vim.bo.expandtab = true

vim.o.modeline = false
vim.bo.modeline = false

vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

vim.o.smartindent = true
vim.bo.smartindent = true

vim.o.swapfile = false
vim.bo.swapfile = false

vim.o.tabstop = 2
vim.bo.tabstop = 2

vim.o.undofile = true
vim.bo.undofile = true

vim.o.foldlevel = 99
vim.wo.foldlevel = 99

vim.o.number = true
vim.wo.number = true

vim.o.relativenumber = true
vim.wo.relativenumber = true

vim.o.wrap = true
vim.wo.wrap = true

vim.api.nvim_command("autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2 sts=4")
vim.api.nvim_command("command! Ctags exe '!ctags -R .'")
vim.api.nvim_command("command! Tab exe 'set tabstop=2 shiftwidth=2 | retab'")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.html.inky   set syntax=html.erb")

-- trailing whitespace
vim.api.nvim_command("autocmd FileType * autocmd BufWritePre <buffer> %s/\\s\\+$//e")

-- bufdelete
function deletable_buffer(operator, current, focus)
  return (operator == 'only' and focus ~= current) or
    (operator == 'after' and focus > current) or
    (operator == 'before' and focus < current)
end

function BufDelete(operator)
  local current = vim.api.nvim_get_current_buf()
  lib.each(vim.api.nvim_list_bufs(), function(focus)
    if deletable_buffer(operator, current, focus) then
      vim.api.nvim_buf_delete(focus, {})
    end
  end)
end

vim.api.nvim_command("command! BufOnly call v:lua.BufDelete('only')")
vim.api.nvim_command("command! BufAfter call v:lua.BufDelete('after')")
vim.api.nvim_command("command! BufBefore call v:lua.BufDelete('before')")

-- search selection
function SearchSelection(args)
  vim.api.nvim_command('Ack -F -- "' .. args .. '"')
end

vim.api.nvim_command("command! -bang -nargs=1 SearchSelection call v:lua.SearchSelection(<q-args>)")

vim.api.nvim_set_keymap("", "<leader>G", "yiw:SearchSelection <C-r>0<cr>", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>G", "y:SearchSelection <C-r>0<cr>", { noremap = true })

-- global replace
function GlobalReplace(old, new)
  vim.api.nvim_command("!rg -l '" .. old .. "' . | xargs perl -pi -e 's/" .. old .. "/" .. new .. "/g'")
  vim.api.nvim_command("echo \"All done.\"")
end

vim.api.nvim_command("command! -bang -nargs=* GlobalReplace call v:lua.GlobalReplace(<f-args>)")

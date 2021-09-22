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
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/temp/undodir"
vim.o.visualbell = false
vim.o.writebackup = false

vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.modeline = false
vim.bo.shiftwidth = 2
vim.bo.smartindent = true
vim.bo.swapfile = false
vim.bo.tabstop = 2
vim.bo.undofile = true

vim.wo.foldlevel = 99
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = true

vim.api.nvim_command("autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2 sts=4")
vim.api.nvim_command("command! Ctags exe '!ctags -R .'")
vim.api.nvim_command("command! Tab exe 'set tabstop=2 shiftwidth=2 | retab'")
vim.api.nvim_command("autocmd BufNewFile,BufRead *.html.inky   set syntax=html.erb")

-- trailing whitespace
vim.api.nvim_command("autocmd FileType * autocmd BufWritePre <buffer> %s/\\s\\+$//e")

-- bufdelete
function BufDelete(operator)
  buffers = vim.api.nvim_eval("map(filter(copy(getbufinfo()), 'v:val.listed && v:val.bufnr " .. operator .. " ' . bufnr('%')), 'v:val.bufnr')")
  for _, buffer in ipairs(buffers) do
    vim.api.nvim_exec(buffer .. "bd", true)
  end
end

vim.api.nvim_command("command! BufOnly call v:lua.BufDelete('!=')")
vim.api.nvim_command("command! BufAfter call v:lua.BufDelete('>')")
vim.api.nvim_command("command! BufBefore call v:lua.BufDelete('<')")

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

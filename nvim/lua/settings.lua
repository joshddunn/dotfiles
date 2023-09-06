local lib = require("lib")

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
vim.g.base16colorspace = 256

vim.g.python_host_prog = os.getenv("HOME") .. "/.asdf/shims/python2"
vim.g.python3_host_prog = os.getenv("HOME") .. "/.asdf/shims/python3"

vim.opt.whichwrap:append("<,>,h,l,[,]")

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
vim.o.pumheight = 20
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

vim.api.nvim_create_user_command("Ctags", "!ctags -R .", { nargs = 0 })

-- display tabs for golang
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.go",
  command = "setlocal noexpandtab tabstop=2 shiftwidth=2 sts=4"
})

-- trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

-- bufdelete
function deletable_buffer(operator, current, focus)
  return (operator == "only" and focus ~= current) or
    (operator == "after" and focus > current) or
    (operator == "before" and focus < current)
end

function BufDelete(operator)
  return function()
    local current = vim.api.nvim_get_current_buf()
    lib.each(vim.api.nvim_list_bufs(), function(focus)
      if deletable_buffer(operator, current, focus) then
        vim.api.nvim_buf_delete(focus, {})
      end
    end)
  end
end

vim.api.nvim_create_user_command("BufOnly", BufDelete("only"), { nargs = 0 })
vim.api.nvim_create_user_command("BufAfter", BufDelete("after"), { nargs = 0 })
vim.api.nvim_create_user_command("BufBefore", BufDelete("before"), { nargs = 0 })

-- global replace
function GlobalReplace(opts)
  local tmpfile = "global-replace-tmp.txt"
  local old = opts.fargs[1]
  local new = opts.fargs[2]
  local filenames = lib.split(vim.fn.trim(vim.fn.system({ "rg", "-l", old })), "\n")
  lib.each(filenames, function(filename)
    local text = vim.fn.system({ "rg", "--passthru", old, "-r", new, filename })
    vim.fn.system({ "tee", tmpfile }, text)
    vim.fn.system({ "mv", tmpfile, filename })
  end)
  vim.api.nvim_echo({{"All Done."}}, false, {})
end

vim.api.nvim_create_user_command("GlobalReplace", GlobalReplace, { nargs = "*" })

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
vim.api.nvim_command("set pumheight=20")

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
  return (operator == "only" and focus ~= current) or
    (operator == "after" and focus > current) or
    (operator == "before" and focus < current)
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
  vim.api.nvim_command("RgQuery " .. args)
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

-- newline
vim.api.nvim_command("command! NoNewline exe 'set binary noeol'")
vim.api.nvim_command("command! Newline exe 'set binary eol'")

-- vim-express
-- vim.g.vim_express = {
--   typescript = true,
--   migrations = {
--     dir = "migrations" -- open most recent migration with :Emigration
--   },
--   tests = {
--     suffix = "Test" -- opens associated file with :A
--   },
--   shortcuts = {
--     edit = {
--       { "controller", "Controller", 1 }, -- :Econtroller <name>
--     }
--   }
-- }

function isExpress()
  local body = lib.read_file("package.json")
  return body and lib.includes(body, "\"express\"")
end

if vim.g.vim_express and isExpress() then
  function ExpressFileType()
    if vim.g.vim_express.typescript then
      return "ts"
    else
      return "js"
    end
  end

  function ExpressEditMostRecentMigrationFile()
    local filenames = vim.fn.split(vim.fn.glob("migrations/*"), "\n")
    vim.api.nvim_command("edit " .. filenames[#filenames])
  end

  function ExpressFileSearch(search, suffix)
    local filenames = vim.fn.system({ "rg", "--files" })
    local results = vim.fn.systemlist({ "rg", "-S", search .. suffix .. "." .. ExpressFileType() }, filenames)

    if vim.fn.empty(results) == 1 then
      vim.api.nvim_command("echo \"Could not find file\"")
    else
      vim.api.nvim_command("edit " .. results[#results])
    end
  end

  function ExpressEditSuffix(suffix)
    return function (opts)
      ExpressFileSearch(opts.args, suffix)
    end
  end

  function ExpressEditAlternateFile()
    local filename = vim.fn.expand('%')
    local alt_filename = nil
    local file_type = "." .. ExpressFileType()
    local suffix = vim.g.vim_express.tests.suffix

    if string.find(filename, suffix .. file_type) then
      alt_filename = string.gsub(filename, suffix .. file_type, '')
    else
      alt_filename = string.gsub(filename, file_type, suffix)
    end

    ExpressFileSearch(alt_filename, "")
  end

  if vim.g.vim_express.migrations then
    vim.api.nvim_create_user_command("Emigration", ExpressEditMostRecentMigrationFile, { nargs = 0 })
  end

  lib.each(vim.g.vim_express.shortcuts.edit, function(shortcut)
    vim.api.nvim_create_user_command(
      "E" .. shortcut[1],
      ExpressEditSuffix(string.lower(shortcut[2])),
      { nargs = shortcut[3] }
    )
  end)

  if vim.g.vim_express.tests then
    vim.api.nvim_create_user_command("A", ExpressEditAlternateFile, { nargs = 0 })
  end
end

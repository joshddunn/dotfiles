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

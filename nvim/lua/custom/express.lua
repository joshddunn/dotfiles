local lib = require("../lib")

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
      vim.api.nvim_echo({{"Could not find file"}}, false, {})
    else
      vim.api.nvim_command("edit " .. results[#results])
    end
  end

  function ExpressEditSuffix(suffix)
    return function (opts)
      ExpressFileSearch("/" .. opts.args, suffix)
    end
  end

  function ExpressEditAlternateFile()
    local filename = vim.fn.expand('%')
    local alt_filename = nil
    local file_type = "." .. ExpressFileType()
    local suffix = vim.g.vim_express.tests.suffix

    if string.find(filename, suffix .. file_type) then
      alt_filename = string.gsub(filename, suffix .. file_type .. '$', '')
    else
      alt_filename = string.gsub(filename, file_type .. '$', suffix)
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

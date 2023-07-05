local lib = require("../lib")

-- vim-navigation
-- make a project a navigation project with
--   git config vim-navigation.project phoenix
-- vim.g.vim_navigation = {
--   phoenix = {
--     migrations = {
--       dir = "priv/repo/migrations/"
--     },
--     alternate = {
--       dir = "lib/",
--       file_pattern = ".ex",
--       test_dir = "test/",
--       test_file_pattern = "_test.exs"
--     },
--     shortcuts = {
--       { "router", "router.ex", 0 },
--       { "controller", "$arg_controller.ex", 1 },
--     }
--   }
-- }

function NavigationProject()
  return lib.replace(vim.fn.system({ "git", "config", "vim-navigation.project" }), "\n", "")
end

if vim.g.vim_navigation and NavigationProject() then
  local config = vim.g.vim_navigation[NavigationProject()]

  -- migrations
  function NavigationEditMostRecentMigrationFile()
    local filenames = vim.fn.split(vim.fn.glob(config.migrations.dir .. "*"), "\n")
    vim.api.nvim_command("edit " .. filenames[#filenames])
  end

  if config.migrations then
    vim.api.nvim_create_user_command("Emigration", NavigationEditMostRecentMigrationFile, { nargs = 0 })
  end

  -- alternate
  function NavigationEditAlternateFile()
    local alt_config = config.alternate
    local filename = lib.replace(vim.api.nvim_buf_get_name(0), vim.fn.getcwd() .. '/', '')
    local old_dir = ''
    local new_dir = ''
    local old_pattern = ''
    local new_pattern = ''

    if (filename:match(alt_config.file_pattern .. '$')) then
      old_dir = alt_config.dir
      new_dir = alt_config.test_dir
      old_pattern = alt_config.file_pattern
      new_pattern = alt_config.test_file_pattern
    elseif (filename:match(alt_config.test_file_pattern .. '$')) then
      old_dir = alt_config.test_dir
      new_dir = alt_config.dir
      old_pattern = alt_config.test_file_pattern
      new_pattern = alt_config.file_pattern
    else
      vim.api.nvim_echo({{"No alternate file defined"}}, false, {})
      return
    end

    local alternate_filename = lib.replace(filename, old_pattern, new_pattern, { suffix = "$" })
    alternate_filename = lib.replace(alternate_filename, old_dir, new_dir, { prefix = "^" })
    vim.api.nvim_command("edit " .. alternate_filename)
  end

  if config.alternate then
    vim.api.nvim_create_user_command("A", NavigationEditAlternateFile, { nargs = 0 })
  end

  -- shortcuts
  function NavigationFileSearch(search, pattern)
    local file = lib.replace(pattern, "$arg", search)
    local filenames = vim.fn.system({ "rg", "--files" })
    local results = vim.fn.systemlist({ "rg", "-S", file}, filenames)

    if vim.fn.empty(results) == 1 then
      vim.api.nvim_echo({{"Could not find file"}}, false, {})
    else
      vim.api.nvim_command("edit " .. results[#results])
    end
  end

  function NavigationEditPattern(pattern)
    return function (opts)
      NavigationFileSearch(opts.args, pattern)
    end
  end

  lib.each(config.shortcuts, function(shortcut)
    vim.api.nvim_create_user_command(
      "E" .. shortcut[1],
      NavigationEditPattern(string.lower(shortcut[2])),
      { nargs = shortcut[3] }
    )
  end)
end

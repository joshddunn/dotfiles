local lib = require("../lib")

-- vim-navigation
vim.g.vim_navigation = {
  phoenix = {
    migrations = {
      dir = "priv/repo/migrations/"
    },
    alternate = {
      dir = "lib/",
      file_pattern = ".ex",
      alt_dir = "test/",
      alt_file_pattern = "_test.exs"
    }
  }
}

if vim.g.vim_navigation then
  local framework = "phoenix"
  local config = vim.g.vim_navigation[framework]

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
      new_dir = alt_config.alt_dir
      old_pattern = alt_config.file_pattern
      new_pattern = alt_config.alt_file_pattern
    elseif (filename:match(alt_config.alt_file_pattern .. '$')) then
      old_dir = alt_config.alt_dir
      new_dir = alt_config.dir
      old_pattern = alt_config.alt_file_pattern
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
end

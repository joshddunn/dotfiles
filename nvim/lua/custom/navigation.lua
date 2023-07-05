local lib = require("../lib")

-- vim-navigation
vim.g.vim_navigation = {
  phoenix = {
    migrations = {
      dir = "priv/repo/migrations/"
    }
  }
}

if vim.g.vim_navigation then
  local framework = "phoenix"
  local config = vim.g.vim_navigation[framework]

  function NavigationEditMostRecentMigrationFile()
    local filenames = vim.fn.split(vim.fn.glob(config.migrations.dir .. "*"), "\n")
    vim.api.nvim_command("edit " .. filenames[#filenames])
  end

  if config.migrations then
    vim.api.nvim_create_user_command("Emigration", NavigationEditMostRecentMigrationFile, { nargs = 0 })
  end
end

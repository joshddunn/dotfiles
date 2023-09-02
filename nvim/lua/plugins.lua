local lib = require("lib")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = lib.map(
  vim.fn.readdir(vim.fn.stdpath('config') .. "/lua/plugins"),
  function(file)
    return require("plugins/" .. lib.replace(file, ".lua", "", { suffix = "$" }))
  end
)

require("lazy").setup(plugins)

local lib = require("lib")

return function(plugins)
  -- local ensure_packer = function()
  --   local fn = vim.fn
  --   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  --   if fn.empty(fn.glob(install_path)) > 0 then
  --     fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  --     vim.cmd [[packadd packer.nvim]]
  --     return true
  --   end
  --   return false
  -- end

  -- local packer_bootstrap = ensure_packer()

  -- return require("packer").startup(function(use)
  --   use "wbthomason/packer.nvim"

  --   lib.each(plugins, function(plugin)
  --     use(plugin)
  --   end)

  --   if packer_bootstrap then
  --     require('packer').sync()
  --   end
  -- end)

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

  return require("lazy").setup(plugins)
end

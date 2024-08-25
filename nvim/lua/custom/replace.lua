local lib = require('../lib')

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e"
})

-- vim-color-replace
-- vim.g.vim_color_replace = {
--   variables_file = string
--   file_type = string (css/scss)
-- }

if vim.g.vim_color_replace then
  function ReplaceColorsWithVariables()
    local variables_file = vim.g.vim_color_replace.variables_file
    local filename = vim.fn.expand('%')
    if string.find(filename, variables_file) then
      -- do nothing
    else
      local results = vim.fn.systemlist({ 'grep', ': #', variables_file })
      lib.each(results, function(result)
        local str = lib.split(result, ': ');
        vim.api.nvim_command('%s/' .. string.gsub(str[2], ';', '') .. '/' .. str[1] .. '/e')
      end)
    end
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*." .. vim.g.vim_color_replace.file_type,
    callback = ReplaceColorsWithVariables
  })
end

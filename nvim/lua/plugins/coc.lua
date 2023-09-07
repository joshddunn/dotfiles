local colors = require("colors")

return {
  "neoclide/coc.nvim",
  branch = "release",
  init = function()
    local opts = { silent = true, expr = true }
    vim.keymap.set("i", "<TAB>", [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()]], opts)
    vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
    vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

    function _G.check_back_space()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
    end

    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = "*",
      command = [[silent! call CocAction("runCommand", "editor.action.organizeImport")]]
    })

    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
    vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
    vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

    vim.g.coc_global_extensions = { "coc-tsserver", "coc-prettier", "coc-eslint", "coc-css", "coc-json", "coc-elixir", "coc-yaml" }
  end
}

return {
  "tpope/vim-abolish",
  init = function()
    vim.keymap.set("i", "_", "<C-]>_")
    vim.keymap.set("i", "-", "<C-]>-")
  end,
  config = function()
    local abolish = {
      { "assurred", "assured" },
      { "retreive", "retrieve" },
    }

    lib.each(abolish, function(a)
      vim.cmd(":Abolish " .. a[1] .. " " .. a[2])
    end)
  end
}

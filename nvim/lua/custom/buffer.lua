local lib = require("../lib")

function deletable_buffer(operator, current, focus)
  return (operator == "only" and focus ~= current) or
    (operator == "after" and focus > current) or
    (operator == "before" and focus < current)
end

function BufDelete(operator)
  return function()
    local current = vim.api.nvim_get_current_buf()
    lib.each(vim.api.nvim_list_bufs(), function(focus)
      if deletable_buffer(operator, current, focus) then
        vim.api.nvim_buf_delete(focus, {})
      end
    end)
  end
end

vim.api.nvim_create_user_command("BufOnly", BufDelete("only"), { nargs = 0 })
vim.api.nvim_create_user_command("BufAfter", BufDelete("after"), { nargs = 0 })
vim.api.nvim_create_user_command("BufBefore", BufDelete("before"), { nargs = 0 })

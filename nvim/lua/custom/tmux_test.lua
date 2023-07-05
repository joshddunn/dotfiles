local lib = require("../lib")

-- tmux test
-- TODO
-- display-message variable names https://man7.org/linux/man-pages/man1/tmux.1.html
-- check to make sure there is a bottom-right pane
-- tmux display-message -t 'bottom-right' -p '#{pane_index}'
-- vim.g.tmux_test = {
--   filetypes = {
--     elixir = {
--       -- matcher = "test [\"'](.+)[\"'] do",
--       cmds = {
--         all = "mix test",
--         file = "mix test $filename",
--         line = "mix test $filename:$line"
--         -- line = "mix test $filename -t \"$name\""
--       }
--     },
--   }
-- }

function TmuxTestRunner(cmd)
  vim.fn.system({ "tmux", "send-keys", "-t", "bottom-right", cmd, "Enter" })
  vim.api.nvim_echo({{"Running tests in another pane..."}}, false, {})
end

function TmuxTestBuildCmd(cmd, filename, line, name)
  local new_cmd = lib.replace(cmd, "$filename", filename)
  new_cmd = lib.replace(new_cmd, "$line", line)
  new_cmd = lib.replace(new_cmd, "$name", name)

  return new_cmd
end

function TmuxTest(type)
  return function()
    local filetype = vim.bo.filetype
    local config = vim.g.tmux_test.filetypes[filetype]

    if config then
      local filename = lib.replace(vim.api.nvim_buf_get_name(0), vim.fn.getcwd() .. '/', '')
      local row, column = unpack(vim.api.nvim_win_get_cursor(0))

      if (type == "all") then
        TmuxTestRunner(config.cmds.all)
      elseif (type == "file") then
        TmuxTestRunner(TmuxTestBuildCmd(config.cmds.file, filename, "", ""))
      elseif (type == "line") then
        if (config.matcher) then
          local lines = vim.api.nvim_buf_get_lines(0, 0, row, true)
          local test_name = nil

          lib.each(lines, function(line)
            local c1 = line:match(config.matcher)
            if (c1) then
              test_name = c1
            end
          end)

          if (test_name) then
            TmuxTestRunner(TmuxTestBuildCmd(config.cmds.line, filename, row, test_name))
          else
            vim.api.nvim_echo({{"No test found"}}, false, {})
          end
        else
          TmuxTestRunner(TmuxTestBuildCmd(config.cmds.line, filename, row, ""))
        end
      end
    else
      vim.api.nvim_echo({{"No config for filetype " .. filetype}}, false, {})
    end
  end
end

vim.api.nvim_create_user_command("TmuxTestAll", TmuxTest("all"), { nargs = 0 })
vim.api.nvim_create_user_command("TmuxTestFile", TmuxTest("file"), { nargs = 0 })
vim.api.nvim_create_user_command("TmuxTestLine", TmuxTest("line"), { nargs = 0 })

vim.api.nvim_set_keymap("n", "<leader>ta", ":TmuxTestAll<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tf", ":TmuxTestFile<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tl", ":TmuxTestLine<cr>", { noremap = true })

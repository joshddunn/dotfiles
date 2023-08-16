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
--     },
--     tests = {
--       -- matcher = "test [\"'](.+)[\"'] do",
--       cmds = {
--         all = "mix test",
--         file = "mix test $filename",
--         line = "mix test $filename:$line"
--         -- line = "mix test $filename -t \"$name\""
--       }
--    }
-- }

function NavigationProject()
  return lib.replace(vim.fn.system({ "git", "config", "vim-navigation.project" }), "\n", "")
end

if vim.g.vim_navigation and NavigationProject() then
  local config = vim.g.vim_navigation[NavigationProject()]

  if config then
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

      if (filename:match(alt_config.test_file_pattern .. '$')) then
        old_dir = alt_config.test_dir
        new_dir = alt_config.dir
        old_pattern = alt_config.test_file_pattern
        new_pattern = alt_config.file_pattern
      elseif (filename:match(alt_config.file_pattern .. '$')) then
        old_dir = alt_config.dir
        new_dir = alt_config.test_dir
        old_pattern = alt_config.file_pattern
        new_pattern = alt_config.test_file_pattern
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

    if config.shortcuts then
      lib.each(config.shortcuts, function(shortcut)
        vim.api.nvim_create_user_command(
          "E" .. shortcut[1],
          NavigationEditPattern(string.lower(shortcut[2])),
          { nargs = shortcut[3] }
        )
      end)
    end

    -- tests
    function NavigationTestRunner(cmd)
      vim.fn.system({ "tmux", "send-keys", "-t", "bottom-right", cmd, "Enter" })
      vim.api.nvim_echo({{"Running tests in another pane..."}}, false, {})
    end

    function NavigationTestBuildCmd(cmd, filename, line, name)
      local new_cmd = lib.replace(cmd, "$filename", filename)
      new_cmd = lib.replace(new_cmd, "$line", line)
      new_cmd = lib.replace(new_cmd, "$name", name)

      return new_cmd
    end

    function NavigationTestGetTestFile(filename)
      local alt_config = config.alternate

      if not (filename:match(alt_config.test_file_pattern .. '$')) then
        local alternate_filename = lib.replace(filename, alt_config.file_pattern, alt_config.test_file_pattern, { suffix = "$" })
        alternate_filename = lib.replace(alternate_filename, alt_config.dir, alt_config.test_dir, { prefix = "^" })
        return alternate_filename
      else
        return filename
      end
    end

    function NavigationTest(type)
      return function()
        local test_config = config.tests
        local filetype = vim.bo.filetype
        local filename = lib.replace(vim.api.nvim_buf_get_name(0), vim.fn.getcwd() .. '/', '')
        local row, column = unpack(vim.api.nvim_win_get_cursor(0))

        if (type == "all") then
          NavigationTestRunner(test_config.cmds.all)
        elseif (type == "file") then
          NavigationTestRunner(NavigationTestBuildCmd(test_config.cmds.file, NavigationTestGetTestFile(filename), "", ""))
        elseif (type == "line") then
          if (test_config.matcher) then
            local lines = vim.api.nvim_buf_get_lines(0, 0, row, true)
            local test_name = nil

            lib.each(lines, function(line)
              local c1 = line:match(test_config.matcher)
              if (c1) then
                test_name = c1
              end
            end)

            if (test_name) then
              NavigationTestRunner(NavigationTestBuildCmd(test_config.cmds.line, filename, row, test_name))
            else
              vim.api.nvim_echo({{"No test found"}}, false, {})
            end
          else
            NavigationTestRunner(NavigationTestBuildCmd(test_config.cmds.line, filename, row, ""))
          end
        end
      end
    end

    if config.tests then
      vim.api.nvim_create_user_command("NavigationTestAll", NavigationTest("all"), { nargs = 0 })
      vim.api.nvim_create_user_command("NavigationTestFile", NavigationTest("file"), { nargs = 0 })
      vim.api.nvim_create_user_command("NavigationTestLine", NavigationTest("line"), { nargs = 0 })

      vim.keymap.set("n", "<leader>ta", ":NavigationTestAll<cr>")
      vim.keymap.set("n", "<leader>tf", ":NavigationTestFile<cr>")
      vim.keymap.set("n", "<leader>tl", ":NavigationTestLine<cr>")
    end
  end
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local glob_ignore = {
      shared = {
        ".git/**",
        ".keep",
      },
      files = {
      },
      global = {
        "*-lock.*",
        "*.lock"
      }
    }

    local function glob_pattern(type)
      local dirs = {}

      if (type == "global") then
        lib.each(glob_ignore.global, function(dir)
          lib.push(dirs, "!" .. dir)
        end)
      end

      if (type == "files") then
        lib.each(glob_ignore.files, function(dir)
          lib.push(dirs, "!" .. dir)
        end)
      end

      lib.each(glob_ignore.shared, function(dir)
        lib.push(dirs, "!" .. dir)
      end)

      return dirs
    end

    local function append_glob_pattern(type, cmd)
      local dirs = glob_pattern(type)

      lib.each(dirs, function(dir)
        lib.push(cmd, "--glob")
        lib.push(cmd, dir)
      end)

      return cmd
    end

    require("telescope").setup {
      defaults = {
        path_display = { "smart" },
        layout_strategy = "vertical"
      },
      pickers = {
        find_files = {
          find_command = append_glob_pattern("files", { "rg", "--files", "--hidden", "--follow" }),
          follow = true
        },
        live_grep = {
          glob_pattern = glob_pattern("global"),
          additional_args = { "--trim" }
        }
      }
    }

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<c-f>", builtin.find_files)
    vim.keymap.set("n", "<leader>b", builtin.buffers)
    vim.keymap.set("n", "<leader>g", builtin.live_grep)
    vim.keymap.set("n", "<leader>G", builtin.grep_string)
    vim.keymap.set("v", "<leader>G", builtin.grep_string)
  end
}

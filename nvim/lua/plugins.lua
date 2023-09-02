require("use")({
  { "airblade/vim-gitgutter", init = function()
    vim.g.gitgutter_enabled = 0
  end },

  "ap/vim-css-color",
  "arecarn/vim-fold-cycle",

  { "edkolev/tmuxline.vim", init = function()
    vim.g.tmuxline_powerline_separators = 0
    vim.g.tmuxline_separators = {
      left =      "",
      left_alt =  "❯",
      right =     "",
      right_alt = "❮",
      space =     " "
    }
  end },

  { "fnune/base16-vim", init = function()
    vim.cmd.colorscheme("base16-tomorrow-night")
  end },

  { "github/copilot.vim", init = function()
    -- if i use other keymap api, it inserts weird characters
    vim.api.nvim_set_keymap("i", "<C-j>", "copilot#Accept(\"\\<CR>\")", { noremap = true, silent = true, expr = true, script = true })
    vim.g.copilot_no_tab_map = true
  end },

  "joom/vim-commentary",

  { "junegunn/vim-easy-align", init = function()
    vim.keymap.set("x", "ga", "<Plug>(EasyAlign)")
    vim.keymap.set("x", "gax", "<Plug>(EasyAlign)<c-x>")
    vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
    vim.keymap.set("n", "gax", "<Plug>(EasyAlign)ip<c-x>")
  end },

  { "justinmk/vim-sneak", init = function()
    vim.keymap.set("", "f", "<Plug>Sneak_s")
    vim.keymap.set("", "F", "<Plug>Sneak_S")
    vim.g["sneak#s_next"] = 1
  end },

  { "lukas-reineke/indent-blankline.nvim", config = function()
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent guifg=#474747 gui=nocombine]]

    require("indent_blankline").setup {
      char_highlight_list = { "IndentBlanklineIndent" },
      show_trailing_blankline_indent = false,
      show_current_context = true,
    }
  end },

  { "maxbrunsfeld/vim-yankstack", init = function()
    vim.keymap.set("n", "c-p", "<Plug>yankstack_substitute_older_paste")
    vim.keymap.set("n", "c-P", "<Plug>yankstack_substitute_newer_paste")
  end },

  { "pseewald/vim-anyfold", init = function()
    vim.api.nvim_command("autocmd BufRead * AnyFoldActivate")
  end },

  "puremourning/vimspector",
  "ruanyl/vim-gh-line",

  { "tpope/vim-abolish", init = function()
    vim.keymap.set("i", "_", "<C-]>_")
    vim.keymap.set("i", "-", "<C-]>-")

    vim.g.abolish_save_file = os.getenv("HOME") .. "/dotfiles/lua/after/abolish.vim"
  end },

  "tpope/vim-endwise",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-surround",

  { "vim-airline/vim-airline", dependencies = "vim-airline/vim-airline-themes", init = function()
    vim.g["airline#extensions#tabline#enabled"] = 1
    vim.g.airline_theme = "base16_tomorrow"
  end},

  { "kyazdani42/nvim-tree.lua", dependencies = "kyazdani42/nvim-web-devicons", config = function()
    vim.keymap.set("", "<leader>nn", ":NvimTreeToggle<cr>")
    vim.keymap.set("", "<leader>nf", ":NvimTreeFindFile<cr>")

    require("nvim-tree").setup {
      view = {
        side = 'right',
        width = 50
      }
    }
  end},

  { "neoclide/coc.nvim", branch = "release" },
  { "nvim-telescope/telescope.nvim", tag = '0.1.2', dependencies = "nvim-lua/plenary.nvim" },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "tsx", "elixir", "heex", "yaml", "terraform" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    }
  end },
})

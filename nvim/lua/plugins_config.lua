lib = require("lib")

-- anyfold
vim.api.nvim_command("autocmd BufRead * AnyFoldActivate")

-- nvim-tree
vim.api.nvim_set_keymap("", "<leader>nn", ":NvimTreeToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>nf", ":NvimTreeFindFile<cr>", { noremap = true })

require("nvim-tree").setup {
  view = {
    side = 'right',
    width = 50
  }
}

-- colorscheme
vim.cmd.colorscheme("base16-tomorrow-night")

-- airline
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g.airline_theme = "base16_tomorrow"

-- telescope
local glob_ignore = {
  shared = {
    "**/node_modules/**",
    ".git/**",
    ".bundle/**",
    "__*/**",
    "tmp/**",
    "**/*.class",
    "_build/**",
    "deps/**",
    "assets/node_modules/**",
    "priv/static/**",
    "modules/**",
    "dist/**",
    "**/vendor/**",
    ".next/**",
    ".elixir_ls/**",
    "dialyzer/**"
  },
  files = {
  },
  global = {
    "package-lock.json",
    "Gemfile.lock",
    "tags",
  }
}

function append_glob_pattern(type, cmd)
  local dirs = glob_pattern(type)

  lib.each(dirs, function(dir)
    lib.push(cmd, "--glob")
    lib.push(cmd, dir)
  end)

  return cmd
end

function glob_pattern(type)
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

require("telescope").setup({
  pickers = {
    find_files = {
      find_command = append_glob_pattern("files", { "rg", "--files", "--no-ignore", "--hidden", "--follow" })
    },
    live_grep = {
      glob_pattern = glob_pattern("global")
    }
  }
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<c-f>", builtin.find_files, { noremap = true })
vim.keymap.set("n", "<leader>b", builtin.buffers, { noremap = true })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { noremap = true })
vim.keymap.set("n", '<leader>G', builtin.grep_string, { noremap = true })
vim.keymap.set("v", '<leader>G', builtin.grep_string, { noremap = true })

-- yankstack
vim.api.nvim_set_keymap("n", "c-p", "<Plug>yankstack_substitute_older_paste", { noremap = true })
vim.api.nvim_set_keymap("n", "c-P", "<Plug>yankstack_substitute_newer_paste", { noremap = true })

-- coc
local opts = { silent = true, noremap = true, expr = true }
vim.api.nvim_set_keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.api.nvim_set_keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
vim.api.nvim_set_keymap("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

vim.api.nvim_command([[
  autocmd BufWritePre *.ts,*.js,*.py,*.rb,*.go silent! call CocAction('runCommand', 'editor.action.organizeImport')
]])

vim.api.nvim_command("highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#444444")

vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", { silent = true })
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { silent = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.tsx" },
  command = "set filetype=typescript.tsx"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.jsx" },
  command = "set filetype=javascript.jsx"
})

vim.g.coc_global_extensions = { "coc-tsserver", "coc-prettier", "coc-eslint", "coc-emmet", "coc-css", "coc-json", "coc-elixir", "coc-yaml" }

-- abolish
vim.api.nvim_set_keymap("i", "_", "<C-]>_", { noremap = true })
vim.api.nvim_set_keymap("i", "-", "<C-]>-", { noremap = true })

vim.g.abolish_save_file = os.getenv("HOME") .. "/dotfiles/lua/after/abolish.vim"

-- indent guides
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1

-- git gutter
vim.g.gitgutter_enabled = 0

-- easy align
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = true })
vim.api.nvim_set_keymap("x", "gax", "<Plug>(EasyAlign)<c-x>", { noremap = true })
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = true })
vim.api.nvim_set_keymap("n", "gax", "<Plug>(EasyAlign)ip<c-x>", { noremap = true })

-- tmux-airline
vim.g.tmuxline_powerline_separators = 0
vim.g.tmuxline_separators = {
  left =      "",
  left_alt =  "❯",
  right =     "",
  right_alt = "❮",
  space =     " "
}

-- search highlighting
vim.api.nvim_command("highlight Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline")

-- github link use GH and GB
vim.g.gh_line_map_default = 0
vim.g.gh_line_blame_map_default = 0
vim.g.gh_open_command = "fn() { echo \"$@\" | pbcopy; }; fn "
vim.g.gh_use_canonical = 1

-- vim-sneak
vim.api.nvim_set_keymap("", "f", "<Plug>Sneak_s", { noremap = true })
vim.api.nvim_set_keymap("", "F", "<Plug>Sneak_S", { noremap = true })
vim.g["sneak#s_next"] = 1

-- vimspector
vim.api.nvim_set_keymap("n", ",dd", ":call vimspector#Launch()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", ",de", ":call vimspector#Reset()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", ",dr", ":call vimspector#Restart()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", ",dc", ":call vimspector#Continue()<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", ",dt", ":call vimspector#ToggleBreakpoint()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", ",dT", ":call vimspector#ClearBreakpoints()<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", ",dk", "<Plug>VimspectorRestart", {})
vim.api.nvim_set_keymap("n", ",dh", "<Plug>VimspectorStepOut", {})
vim.api.nvim_set_keymap("n", ",dl", "<Plug>VimspectorStepInto", {})
vim.api.nvim_set_keymap("n", ",dj", "<Plug>VimspectorStepOver", {})

vim.g.vimspector_base_dir = os.getenv("HOME") .. "/.local/share/nvim/site/pack/packer/start/vimspector"
vim.g.vimspector_install_gadgets = { 'vscode-node-debug2' }
vim.g.vimspector_configurations = {
  Node = {
    adapter = "vscode-node",
    default = true,
    breakpoints = {
      exception = {
        all = "N",
        uncaught = "N"
      }
    },
    configuration = {
      name = "Attaching to node",
      type = "node",
      request = "attach",
      restart = true, -- this should work but doesn't seem to
      port = 9229,
    }
  }
}

vim.g.vimspector_sidebar_width = 100
vim.g.vimspector_bottombar_height = 5

-- copilot
vim.api.nvim_set_keymap("i", "<C-j>", "copilot#Accept(\"\\<CR>\")", { silent = true, expr = true, script = true })
vim.g.copilot_no_tab_map = true

-- treesitter
require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "tsx", "elixir", "heex", "yaml" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

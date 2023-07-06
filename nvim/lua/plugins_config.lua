lib = require("lib")

-- vim-glob
vim.g.glob_ignore = {
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
vim.api.nvim_command([[
  try
    colorscheme base16-tomorrow-night
  catch
  endtry
]])

-- airline
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g.airline_theme = "base16_tomorrow"

-- fzf
vim.g.fzf_command_prefix = "Fzf"
vim.g.fzf_tags_command = "ctags -R"
vim.g.fzf_buffers_jump = 1
vim.g.fzf_preview_window = { 'right:50%:hidden', 'ctrl-/' }

vim.api.nvim_set_keymap("", "<leader>j", ":Files<cr>", { noremap = true }) -- do i ever use this?
vim.api.nvim_set_keymap("", "<c-f>", ":Files<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>b", ":FzfBuffers<cr>", { noremap = true }) -- do i ever use this?

vim.env["FZF_DEFAULT_COMMAND"] = "rg --files --no-ignore --hidden --follow " .. vim.fn["glob#ignore"]("files")

vim.api.nvim_command("command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)")

function exclude_types(types)
  return lib.join(lib.map(lib.split(types, " "), function(t)
    return "--type-not \"" .. t .. "\""
  end), " ")
end

function RipgrepFzf(types, fullscreen)
  local command = "rg --type-add 'feature:*.{feature}' --line-number --no-heading --color=always --smart-case " .. exclude_types(types) .. vim.fn["glob#ignore"]("global") .. " -- {q} || true"
  local initial_command = string.gsub(command, "{q}", "''")
  local spec = { options = {"--phony", "--bind", "change:reload:" .. command} }

  vim.fn["fzf#vim#grep"](initial_command, 1, vim.fn["fzf#vim#with_preview"](spec), fullscreen)
end

-- might need to shellescape the query
function RipgrepFzfQuery(query, fullscreen)
  local command = "rg --line-number --no-heading --color=always --smart-case " .. vim.fn["glob#ignore"]("global") .. " -- {q} || true"
  local initial_command = string.gsub(command, "{q}", "'" .. shellescape(query) .. "'")
  local spec = { options = {"--phony", "--query", shellescape(query), "--bind", "change:reload:" .. command} }

  vim.fn["fzf#vim#grep"](initial_command, 1, vim.fn["fzf#vim#with_preview"](spec), fullscreen)
end

function shellescape(str)
  str = string.gsub(str, "\\", "\\\\")
  str = string.gsub(str, "%(", "\\(")
  str = string.gsub(str, "%)", "\\)")
  str = string.gsub(str, "%[", "\\[")
  str = string.gsub(str, "%]", "\\]")

  subs = { "*", "?", "{", "}" }

  lib.each(subs, function(sub)
    str = string.gsub(str, sub, "\\" .. sub)
  end)

  return str
end

vim.api.nvim_command("command! -nargs=* -bang RgQuery call v:lua.RipgrepFzfQuery(<q-args>, <bang>0)")
vim.api.nvim_command("command! -nargs=* -bang Rg call v:lua.RipgrepFzf(<q-args>, <bang>0)")
vim.api.nvim_set_keymap("", "<leader>g", ":Rg<cr>", { noremap = true })

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

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
  },
  files = {
  },
  global = {
    "package-lock.json",
    "Gemfile.lock",
    "tags",
  }
}

-- nvim-tree
vim.api.nvim_set_keymap("", "<leader>nn", ":NvimTreeToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>nf", ":NvimTreeFindFile<cr>", { noremap = true })

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

vim.api.nvim_set_keymap("", "<leader>j", ":Files<cr>", { noremap = true }) -- do i ever use this?
vim.api.nvim_set_keymap("", "<c-f>", ":Files<cr>", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>b", ":FzfBuffers<cr>", { noremap = true }) -- do i ever use this?

vim.env["FZF_DEFAULT_COMMAND"] = "rg --files --no-ignore --hidden --follow " .. vim.fn["glob#ignore"]("files")

vim.api.nvim_command("command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)")

vim.api.nvim_command([[
  command! -bang -nargs=* Rg
    call fzf#vim#grep(
      'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      <bang>0 ? fzf#vim#with_preview('up:60%')
              : fzf#vim#with_preview('right:50%:hidden', '?'),
      <bang>0)
]])

-- yankstack
vim.api.nvim_set_keymap("n", "c-p", "<Plug>yankstack_substitute_older_paste", { noremap = true })
vim.api.nvim_set_keymap("n", "c-P", "<Plug>yankstack_substitute_newer_paste", { noremap = true })

-- coc
vim.g.OmniSharp_server_use_mono = 1

vim.api.nvim_set_keymap("i", "<TAB>", [[ pumvisible() ? "\<C-n>" : CheckBackSpace() ? "\<TAB>" : coc#refresh() ]], { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<S-TAB>", [[ pumvisible() ? "\<C-p>" : "\<C-h>" ]], { silent = true, expr = true })

vim.api.nvim_command([[
  function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
  endfunction
]])

vim.api.nvim_command("highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#444444")

-- ack
vim.g.ackprg = "rg --vimgrep --smart-case" .. vim.fn["glob#ignore"]("global")

vim.api.nvim_set_keymap("", "<leader>g", ":Ack -F -- \"\"<Left>", { noremap = true })

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

-- ale
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = "!"
vim.g.ale_sign_warning = "?"
vim.g.ale_linters = {
  elixir = {},
  cs = {"OmniSharp"},
}

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
vim.g.gh_use_canonical = 0

-- vim-sneak
vim.api.nvim_set_keymap("", "f", "<Plug>Sneak_s", { noremap = true })
vim.api.nvim_set_keymap("", "F", "<Plug>Sneak_S", { noremap = true })
vim.g["sneak#s_next"] = 1

local utils = require("utils")

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
vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_width = 50

utils.map("", "<leader>nn", ":NvimTreeToggle<cr>", nil)
utils.map("", "<leader>nf", ":NvimTreeFindFile<cr>", nil)

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

utils.map("", "<leader>j", ":Files<cr>", nil) -- do i ever use this?
utils.map("", "<c-f>", ":Files<cr>", nil)
utils.map("", "<leader>b", ":FzfBuffers<cr>", nil) -- do i ever use this?

vim.api.nvim_command("let $FZF_DEFAULT_COMMAND = 'rg --files --no-ignore --hidden --follow ' . glob#ignore('files')")

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
utils.map("n", "c-p", "<Plug>yankstack_substitute_older_paste", nil)
utils.map("n", "c-P", "<Plug>yankstack_substitute_newer_paste", nil)

-- coc
vim.g.OmniSharp_server_use_mono = 1

utils.map("i", "<TAB>", "pumvisible() ? '<C-n>' : check_back_space() ? '<TAB>' : coc#refresh()", { silent = true, expr = true })
utils.map("i", "<S-TAB>", "pumvisible() ? '<C-p>' : '<C-h>'", { silent = true, expr = true })

vim.api.nvim_command("highlight Pmenu ctermbg=239 guibg=#504945")

-- ack
vim.api.nvim_command([[
  if executable('rg')
    let g:ackprg = 'rg --vimgrep --smart-case ' . glob#ignore('global')
  endif
]])

utils.map("", "<leader>g", ":Ack -F -- \"\"<Left>", nil)

-- youcompleteme
vim.api.nvim_command("highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#444444")

-- abolish
utils.map("i", "_", "<C-]>_", nil)
utils.map("i", "-", "<C-]>-", nil)

vim.api.nvim_command([[
  let g:abolish_save_file = expand('~/.config/nvim/after/plugin/abolish.vim')
]])

-- anyfold
vim.api.nvim_command("autocmd Filetype * AnyFoldActivate")

-- jsx
vim.g.jsx_ext_required = 0

-- indent guides
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_start_level = 2
vim.g.indent_guides_guide_size = 1

-- git gutter
vim.g.gitgutter_enabled = 0

-- ale
vim.g.ale_fix_on_save = 1
vim.g.ale_sign_error = '!'
vim.g.ale_sign_warning = '?'
vim.g.ale_linters = {
  elixir = {},
  cs = {'OmniSharp'},
}

-- easy align
utils.map("x", "ga", "<Plug>(EasyAlign)", nil)
utils.map("x", "gax", "<Plug>(EasyAlign)<c-x>", nil)
utils.map("n", "ga", "<Plug>(EasyAlign)", nil)
utils.map("n", "gax", "<Plug>(EasyAlign)ip<c-x>", nil)

-- tmux-airline
vim.g.tmuxline_powerline_separators = 0
vim.g.tmuxline_separators = {
  left =      '',
  left_alt =  '❯',
  right =     '',
  right_alt = '❮',
  space =     ' '
}

-- search highlighting
vim.api.nvim_command("highlight Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline")

-- github link use GH and GB
vim.g.gh_line_map_default = 0
vim.g.gh_line_blame_map_default = 0
vim.g.gh_open_command = 'fn() { echo "$@" | pbcopy; }; fn '
vim.g.gh_use_canonical = 0

-- vim-sneak
utils.map("", "f", "<Plug>Sneak_s", nil)
utils.map("", "F", "<Plug>Sneak_S", nil)
vim.g["sneak#s_next"] = 1

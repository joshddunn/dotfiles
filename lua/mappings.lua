-- search / and backward search ?
vim.api.nvim_set_keymap("", "<space>", "/", { noremap = true })
vim.api.nvim_set_keymap("v", "<space>", "y/<C-r>0<cr><S-n>", { noremap = true })
vim.api.nvim_set_keymap("", "<c-s>", "yiw/<C-r>0<cr><S-n>cgn", { noremap = true })
vim.api.nvim_set_keymap("v", "<c-s>", "y/<C-r>0<cr><S-n>cgn", { noremap = true })
vim.api.nvim_set_keymap("", "<c-space>", "?", { noremap = true })

-- remove search highlight
vim.api.nvim_set_keymap("", "<leader><cr>", ":noh<cr>", { noremap = true, silent = true })

-- windows
vim.api.nvim_set_keymap("", "<C-l>", "<C-W>l", { noremap = true })
vim.api.nvim_set_keymap("", "<C-j>", "<C-W>j", { noremap = true })
vim.api.nvim_set_keymap("", "<C-k>", "<C-W>k", { noremap = true })
vim.api.nvim_set_keymap("", "<C-h>", "<C-W>h", { noremap = true })

-- copy to clipboard
vim.api.nvim_set_keymap("v", "<leader>y", "\"+y", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>Y", "\"+yg_", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>y", "\"+y", { noremap = true })

-- paste from clipboard
vim.api.nvim_set_keymap("n", "<leader>p", "\"+p", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>P", "\"+p", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>p", "\"+p", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>P", "\"+p", { noremap = true })

-- move between buffers
vim.api.nvim_set_keymap("n", "<Tab>", ":NvimTreeClose<cr>:bn<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":NvimTreeClose<cr>:bp<cr>", { noremap = true })

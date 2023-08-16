-- search / and backward search ?
vim.keymap.set("", "<space>", "/")
vim.keymap.set("v", "<space>", "y/<C-r>0<cr><S-n>")
vim.keymap.set("", "<c-s>", "yiw/<C-r>0<cr><S-n>cgn")
vim.keymap.set("v", "<c-s>", "y/<C-r>0<cr><S-n>cgn")
vim.keymap.set("", "<c-space>", "?")

-- remove search highlight
vim.keymap.set("", "<leader><cr>", ":noh<cr>", { silent = true })

-- windows
vim.keymap.set("", "<C-l>", "<C-W>l")
vim.keymap.set("", "<C-j>", "<C-W>j")
vim.keymap.set("", "<C-k>", "<C-W>k")
vim.keymap.set("", "<C-h>", "<C-W>h")

-- copy to clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+yg_")
vim.keymap.set("n", "<leader>y", "\"+y")

-- paste from clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>P", "\"+p")

-- move between buffers
vim.keymap.set("n", "<Tab>", ":NvimTreeClose<cr>:bn<cr>")
vim.keymap.set("n", "<S-Tab>", ":NvimTreeClose<cr>:bp<cr>")

local utils = require("utils")

-- search / and backward search ?
utils.map("", "<space>", "/", nil)
utils.map("v", "<space>", "y/<C-r>0<cr><S-n>", nil)
utils.map("", "<c-s>", "yiw/<C-r>0<cr><S-n>cgn", nil)
utils.map("v", "<c-s>", "y/<C-r>0<cr><S-n>cgn", nil)
utils.map("", "<c-space>", "?", nil)

-- remove search highlight
utils.map("", "<leader><cr>", ":noh<cr>", { silent = true })

-- windows
utils.map("", "<C-l>", "<C-W>l", nil)
utils.map("", "<C-j>", "<C-W>j", nil)
utils.map("", "<C-k>", "<C-W>k", nil)
utils.map("", "<C-h>", "<C-W>h", nil)


-- copy to clipboard
utils.map("v", "<leader>y", "\"+y", nil)
utils.map("n", "<leader>Y", "\"+yg_", nil)
utils.map("n", "<leader>y", "\"+y", nil)

-- paste from clipboard
utils.map("n", "<leader>p", "\"+p", nil)
utils.map("n", "<leader>P", "\"+p", nil)
utils.map("v", "<leader>p", "\"+p", nil)
utils.map("v", "<leader>P", "\"+p", nil)

-- move between buffers
utils.map("n", "<Tab>", ":NvimTreeClose<cr>:bn<cr>", nil)
utils.map("n", "<S-Tab>", ":NvimTreeClose<cr>:bp<cr>", nil)

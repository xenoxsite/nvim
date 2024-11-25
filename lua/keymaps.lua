local function map(mode, keys, action, desc)
    desc = desc or ""
    local opts = { silent = true, noremap = true, desc = desc }
    vim.keymap.set(mode, keys, action, opts)
end

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-s>", "<cmd>write<CR>")
map("n", "<Tab>", "<cmd>bnext<CR>")
map("n", "<s-Tab>", "<cmd>bprev<CR>")
map("n", "<s-Tab>", "<cmd>bprev<CR>")

map("n", "<A-k>", ":resize +2<CR>")
map("n", "<A-j>", ":resize -2<CR>")
map("n", "<A-h>", ":vertical resize +2<CR>")
map("n", "<A-l>", ":vertical resize -2<CR>")

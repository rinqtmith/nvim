vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jj", "<ESC>")
keymap.set("n", "Q", "<nop>")

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

keymap.set("n", "<leader>eq", ":lua ColorMyPencils()<CR>")

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { silent = true }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { silent = true }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { silent = true }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>", { silent = true }) -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>", { silent = true }) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { silent = true }) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", { silent = true }) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { silent = true }) --  go to previous tab

keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>", { silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>f", vim.lsp.buf.format)

keymap.set("n", "<C-ğ>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-ü>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

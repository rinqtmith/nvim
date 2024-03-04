---@diagnostic disable: assign-type-mismatch
local opt = vim.opt
local g = vim.g

g.loaded_perl_provider = 0
g.python3_host_prog = "/usr/bin/python3"
g.loaded_ruby_provider = 0
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.number = true
opt.relativenumber = true

opt.splitright = true
opt.splitbelow = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true

opt.scrolloff = 30

opt.wrap = false
opt.conceallevel = 2

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/./undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.inccommand = "split"

opt.termguicolors = true

opt.colorcolumn = "120"

opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.backspace = "indent,eol,start"
opt.completeopt = "menuone,noselect"

opt.clipboard:append("unnamedplus")
opt.iskeyword:append("-")

opt.fillchars = "eob: "
opt.virtualedit = "block"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

g.mapleader = " "

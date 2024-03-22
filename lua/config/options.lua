---@diagnostic disable: assign-type-mismatch
local opt = vim.opt
local g = vim.g

g.loaded_perl_provider = 0
g.python3_host_prog = "/usr/bin/python3"
g.loaded_ruby_provider = 0
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.scrolloff = 30

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/./undodir"
opt.undofile = true

opt.colorcolumn = "120"

opt.isfname:append("@-@")

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")
opt.iskeyword:append("-")

opt.fillchars = "eob: "

opt.cursorline = false

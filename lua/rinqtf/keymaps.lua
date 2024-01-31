local wk = require("which-key")

wk.register({
	["<C-h>"] = { "<C-w>h", "Go to left window" },
	["<C-l>"] = { "<C-w>l", "Go to right window" },
	["<C-k>"] = { "<C-w>k", "Go to up window" },
	["<C-j>"] = { "<C-w>j", "Go to down window" },
	["<C-Up>"] = { "<cmd>resize +3<cr>", "Increase window height" },
	["<C-Down>"] = { "<cmd>resize -3<cr>", "Decrease window height" },
	["<C-Left>"] = { "<cmd>vertical resize -3<cr>", "Decrease window width" },
	["<C-Right>"] = { "<cmd>vertical resize +3<cr>", "Increase window width" },

	["<A-j>"] = { "<cmd>m .+1<cr>==", "Move down" },
	["<A-k>"] = { "<cmd>m .-2<cr>==", "Move up" },

	["<tab>"] = { "<cmd>bn<cr>", "Next buffer" },
	["<S-tab>"] = { "<cmd>bp<cr>", "Previous buffer" },

	["<C-d>"] = { "<C-d>zz", "Go down" },
	["<C-u>"] = { "<C-u>zz", "Go up" },

	n = { "nzzzv", "Find next" },
	N = { "Nzzzv", "Find previous" },

	["<F12"] = {
		function()
			vim.cmd.cnext()
		end,
		"Next quickfix",
	},
	["<F11"] = {
		function()
			vim.cmd.cprev()
		end,
		"Previous quickfix",
	},
})

wk.register({
	["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi", "Move down" },
	["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi", "Move up" },
}, { mode = "i" })

wk.register({
	["<A-j>"] = { ":m '>+1<cr>gv=gv", "Move down" },
	["<A-k>"] = { ":m '<-2<cr>gv=gv", "Move up" },

	["<"] = { "<gv", "Indent left" },
	[">"] = { ">gv", "Indent right" },
}, { mode = "v" })

wk.register({
	["<C-s>"] = { "<cmd>w<cr><esc>", "Save file" },
}, { mode = { "i", "x", "n", "s" } })

wk.register({
	["<leader>"] = {
		w = {
			name = "+window",
			o = { "<C-w>o", "Close other windows" },
			q = { "<C-w>q", "Quit a window" },
			s = { "<C-w>s", "Split a window" },
			v = { "<C-w>v", "Vertical split a window" },
			T = { "<C-w>T", "Into new tab" },
			w = { "<C-w>w", "Switch windows" },
			["="] = { "<C-w>=", "Equal sizes" },
			["_"] = { "<C-w>_", "Max out the height" },
			["|"] = { "<C-w>|", "Max out the width" },
		},
		b = {
			name = "+buffers",
			d = { "<cmd>bd<cr>", "Delete buffer" },
		},
		x = {
			name = "+list",
			l = { "<cmd>lopen<cr>", "Location list" },
			q = { "<cmd>copen<cr>", "Location list" },
		},
		qq = { "<cmd>qa<cr>", "Quit all" },
		e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
		t = {
			name = "+tab",
			n = { "<cmd>tabn<cr>", "Next tab" },
			p = { "<cmd>tabp<cr>", "Preivous tab" },
			o = { "<cmd>tabnew<cr>", "New tab" },
			q = { "<cmd>tabclose<cr>", "Close tab" },
		},
		f = {
			name = "+find",
			f = { "<cmd>Telescope find_files<cr>", "Find files" },
			b = { "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", "Find buffers" },
			g = { "<cmd>Telescope git_files<cr>", "Find files (git files)" },
			r = { "<cmd>Telescope oldfiles<cr>", "Recent" },
		},
		g = {
			name = "+git",
			c = { "<cmd>Telescope git_commits<cr>", "Commits" },
			s = { "<cmd>Telescope git_status<cr>", "Status" },
		},
		s = {
			name = "+search",
			r = { "<cmd>Telescope registers<cr>", "Registers" },
			b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
			g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
			h = { "<cmd>Telescope help_tags<cr>", "Help" },
		},
	},
})

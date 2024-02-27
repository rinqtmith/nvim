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

	["<S-l>"] = { "<cmd>bn<cr>", "Next buffer" },
	["<S-h>"] = { "<cmd>bp<cr>", "Previous buffer" },

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
			-- p = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
			-- c = { "<cmd>BufferLinePickClose<cr>", "Pick and close buffer" },
		},
		x = {
			name = "+list",
			d = {
				function()
					require("trouble").toggle("document_diagnostics")
				end,
				"Document diagnostics",
			},
			w = {
				function()
					require("trouble").toggle("workspace_diagnostics")
				end,
				"Workspace diagnostics",
			},
			l = {
				function()
					require("trouble").toggle("loclist")
				end,
				"Location list",
			},
			q = {
				function()
					require("trouble").toggle("quickfix")
				end,
				"Quickfix list",
			},
			r = {
				function()
					require("trouble").toggle("lsp_references")
				end,
				"Trouble lsp references",
			},
			x = {
				function()
					require("trouble").toggle()
				end,
				"Trouble toggle",
			},
		},
		n = {
			name = "+noice",
			d = { "<cmd>NoiceDismiss<cr>", "Dismiss message" },
		},
	},
})

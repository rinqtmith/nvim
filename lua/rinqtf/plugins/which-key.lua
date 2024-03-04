return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local mappings = {
			-- q = { "<cmd>confirm q<CR>", "Quit" },
			h = { "<cmd>nohlsearch<CR>", "NOHL" },
			s = { name = "[S]earch" },
			g = { name = "Git" },
			a = {
				name = "Tab",
				n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
				N = { "<cmd>tabnew %<cr>", "New Tab" },
				o = { "<cmd>tabonly<cr>", "Only" },
				h = { "<cmd>-tabmove<cr>", "Move Left" },
				l = { "<cmd>+tabmove<cr>", "Move Right" },
			},
			T = { name = "Treesitter" },
		}

		local which_key = require("which-key")
		which_key.setup({
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
				},
			},
			window = {
				border = "rounded",
				position = "bottom",
				padding = { 1, 1, 1, 1 },
			},
			ignore_missing = true,
			show_help = false,
			show_keys = false,
			disable = {
				buftypes = {},
				filetypes = { "TelescopePrompt" },
			},
		})

		local opts = {
			mode = "n", -- NORMAL mode
			prefix = "<leader>",
		}

		which_key.register(mappings, opts)
	end,
}

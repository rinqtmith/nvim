return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		local wk = require("which-key")
		local builtin = require("telescope.builtin")
		wk.register({
			["<leader><leader>"] = { builtin.buffers, "[ ] Find existing buffers" },
			["<leader>sk"] = { builtin.keymaps, "[S]earch [K]eymaps" },
			["<leader>sh"] = { builtin.help_tags, "[S]earch [H]elp" },
			["<leader>sf"] = { builtin.find_files, "[S]earch [F]iles" },
			["<leader>ss"] = { builtin.builtin, "[S]earch [S]elect Telescope" },
			["<leader>sw"] = { builtin.grep_string, "[S]earch current [W]ord" },
			["<leader>sg"] = { builtin.live_grep, "[S]earch by [G]rep" },
			["<leader>sd"] = { builtin.diagnostics, "[S]earch [D]iagnostics" },
			["<leader>sr"] = { builtin.resume, "[S]earch [R]esume" },
			["<leader>s."] = { builtin.oldfiles, "[S]earch Recent Files ('.' for repeat)" },
			["<leader>s/"] = {
				function()
					builtin.live_grep({
						grep_open_files = true,
						prompt_title = "Live Grep in Open Files",
					})
				end,
				"[S]earch [/] in Open Files",
			},
			["<leader>sn"] = {
				function()
					builtin.find_files({ cwd = vim.fn.stdpath("config") })
				end,
				"[S]earch [N]eovim files",
			},
		})

		local icons = require("rinqtf.icons")
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				prompt_prefix = icons.ui.Telescope .. " ",
				selection_caret = icons.ui.Forward .. " ",
				entry_prefix = "   ",
				initial_mode = "insert",
				selection_strategy = "reset",
				path_display = { "smart" },
				color_devicons = true,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = {
						["<esc>"] = actions.close,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				live_grep = {
					theme = "dropdown",
				},

				grep_string = {
					theme = "dropdown",
				},

				find_files = {
					theme = "dropdown",
					previewer = false,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
					initial_mode = "normal",
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							["dd"] = actions.delete_buffer,
						},
					},
				},
				planets = {
					show_pluto = true,
					show_moon = true,
				},
				colorscheme = {
					enable_preview = true,
				},
				lsp_references = {
					theme = "dropdown",
					initial_mode = "normal",
				},
				lsp_definitions = {
					theme = "dropdown",
					initial_mode = "normal",
				},
				lsp_declarations = {
					theme = "dropdown",
					initial_mode = "normal",
				},
				lsp_implementations = {
					theme = "dropdown",
					initial_mode = "normal",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
		-- require("telescope").load_extension("noice")
	end,
}

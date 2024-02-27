---@diagnostic disable: undefined-field
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local navic = require("nvim-navic")
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				ignore_focus = { "NvimTree" },
			},
			sections = {
				lualine_a = { "filename" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "diagnostics" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						function()
							return navic.get_location()
						end,
						cond = function()
							return navic.is_available()
						end,
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "buffers" },
			},
			extensions = { "quickfix", "man", "fugitive" },
		})
	end,
}

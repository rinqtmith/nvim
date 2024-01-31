return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			layout = {
				max_width = { 70, 0.2 },
				min_width = 40,
			},
		})
	end,
}

return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			backends = { "lsp" },
			layout = {
				max_width = { 70, 0.2 },
				min_width = 40,
			},
			filter_kind = false,
		})
	end,
}

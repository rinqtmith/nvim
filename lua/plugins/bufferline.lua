return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				numbers = function(opts)
					---@diagnostic disable-next-line: undefined-field
					return string.format("%s|%s", opts.id, opts.ordinal)
				end,
			},
		})
	end,
}

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			routes = {
				{
					filter = { event = "notify", find = "No information available" },
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						find = "%d+L, %d+B",
					},
					opts = { skip = true },
				},
			},
			presets = {
				lsp_doc_border = true, -- add a border to hover docs and signature help
				inc_rename = true,
			},
		})
		vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
		require("notify").setup({
			background_colour = "#000000",
		})
	end,
}

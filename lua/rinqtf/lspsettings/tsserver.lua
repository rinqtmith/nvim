local wk = require("which-key")
wk.register({
	["<leader>t"] = {
		name = "+tsserver",
		r = {
			function()
				vim.lsp.buf.code_action({
					apply = true,
					context = {
						only = { "source.removeUnused.ts" },
						diagnostics = {},
					},
				})
			end,
			"Remove Unused Imports",
		},
		o = {
			function()
				vim.lsp.buf.code_action({
					apply = true,
					context = {
						only = { "source.organizeImports.ts" },
						diagnostics = {},
					},
				})
			end,
			"Organize Imports",
		},
	},
})
return {
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
}

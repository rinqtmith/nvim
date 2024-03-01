return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")
		local formatting = null_ls.builtins.formatting
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		mason_null_ls.setup({
			ensure_installed = EXTRAS,
		})

		null_ls.setup({
			debug = false,
			sources = {
				formatting.stylua,
				formatting.prettier,
				null_ls.builtins.completion.spell,
			},
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
								timeout_ms = 2000,
							})
						end,
					})
				end
			end,
		})
	end,
}

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "folke/neodev.nvim" },
	config = function()
		local function lsp_keymaps(bufnr)
			local wk = require("which-key")
			local builtin = require("telescope.builtin")
			wk.register({
				["gd"] = { builtin.lsp_definitions, "[G]oto [D]efinition", { buffer = bufnr } },
				["gr"] = { builtin.lsp_references, "[G]oto [R]eferences", { buffer = bufnr } },
				["gI"] = { builtin.lsp_implementations, "[G]oto [I]mplementation", { buffer = bufnr } },
				["<leader>D"] = { builtin.lsp_type_definitions, "Type [D]efinition", { buffer = bufnr } },
				["<leader>ds"] = { builtin.lsp_document_symbols, "[D]ocument [S]ymbols", { buffer = bufnr } },
				["<leader>rn"] = { vim.lsp.buf.rename, "[R]e[n]ame", { buffer = bufnr } },
				["<leader>ca"] = {
					vim.lsp.buf.code_action,
					"[C]ode [A]ction",
					mode = { "n", "v" },
					{ buffer = bufnr },
				},
				["K"] = { vim.lsp.buf.hover, "Hover Documentation", { buffer = bufnr } },
				["gD"] = { vim.lsp.buf.declaration(), "[G]oto [D]eclaration", { buffer = bufnr } },
				["]d"] = { vim.diagnostic.goto_next, "Go to next [D]iagnostic message", { buffer = bufnr } },
				["[d"] = { vim.diagnostic.goto_prev, "Go to previous [D]iagnostic message", { buffer = bufnr } },
				["<leader>cla"] = { vim.lsp.codelens.run, "[C]ode[L]ens [A]ction", { buffer = bufnr } },
				["<leader>q"] = { vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list" },
				["<leader>l"] = { vim.diagnostic.open_float, "Show diagnostic [E]rror messages" },
			})
		end
		local on_attach = function(client, bufnr)
			lsp_keymaps(bufnr)
			if client.supports_method("textDocument/inlayHint") then
				vim.lsp.inlay_hint.enable(bufnr, true)
			end
		end
		local function common_capabilities()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			---@diagnostic disable-next-line: inject-field
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			---@diagnostic disable-next-line: cast-local-type
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			return capabilities
		end
		local lspconfig = require("lspconfig")
		local icons = require("rinqtf.icons")
		local servers = SERVERS
		local default_diagnostic_config = {
			signs = {
				active = true,
				values = {
					{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
					{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
					{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
					{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
				},
			},
			virtual_text = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}
		vim.diagnostic.config(default_diagnostic_config)
		---@diagnostic disable-next-line: param-type-mismatch
		for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
		end
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		require("lspconfig.ui.windows").default_options.border = "rounded"
		for _, server in pairs(servers) do
			local opts = {
				on_attach = on_attach,
				capabilities = common_capabilities(),
			}

			local require_ok, settings = pcall(require, "rinqtf.lspsettings." .. server)
			if require_ok then
				---@diagnostic disable-next-line: cast-local-type
				opts = vim.tbl_deep_extend("force", settings, opts)
			end

			if server == "lua_ls" then
				require("neodev").setup({})
			end

			lspconfig[server].setup(opts)
		end
	end,
}

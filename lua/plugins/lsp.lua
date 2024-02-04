return {
	{
		"VonHeikemen/lsp-zero.nvim",
		lazy = true,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("neodev").setup()
			local lsp_zero = require("lsp-zero")
			local wk = require("which-key")
			local builtin = require("telescope.builtin")
			lsp_zero.on_attach(function(_, bufnr)
				wk.register({
					K = {
						function()
							vim.lsp.buf.hover()
						end,
						"Hover",
					},
					["<F2>"] = {
						function()
							vim.lsp.buf.rename()
						end,
						"Rename",
					},
					["<leader>"] = {
						d = {
							name = "+diagnostic",
							d = {
								function()
									builtin.diagnostics({ bufnr = 0 })
								end,
								"Document diagnostics",
							},
							w = {
								function()
									builtin.diagnostics()
								end,
								"Workspace diagnostics",
							},
							s = {
								function()
									builtin.lsp_document_symbols()
								end,
								"Document symbols",
							},
							l = {
								function()
									builtin.lsp_dynamic_workspace_symbols()
								end,
								"Workspace symbols",
							},
						},
						l = {
							name = "+lsp",
							f = {
								function()
									require("conform").format({ async = true, lsp_fallback = true })
								end,
								"Format",
							},
							d = {
								function()
									builtin.lsp_definitions({ reuse_win = true })
								end,
								"Definition",
							},
							D = {
								function()
									vim.lsp.buf.declaration()
								end,
								"Declaration",
							},
							i = {
								function()
									builtin.lsp_implementations({ reuse_win = true })
								end,
								"Implementation",
							},
							o = {
								function()
									builtin.lsp_type_definitions({ reuse_win = true })
								end,
								"Type definition",
							},
							r = {
								function()
									builtin.lsp_references({ reuse_win = true })
								end,
								"References",
							},
							s = {
								function()
									vim.lsp.buf.signature_help()
								end,
								"Signature help",
							},
							a = {
								function()
									vim.lsp.buf.code_action()
								end,
								"Code action",
							},
							l = {
								function()
									vim.diagnostic.open_float()
								end,
								"Float diagnostic",
							},
							n = {
								function()
									vim.diagnostic.goto_next()
								end,
								"Next diagnostic",
							},
							p = {
								function()
									vim.diagnostic.goto_prev()
								end,
								"Previous diagnostic",
							},
						},
					},
				}, { bufnr = bufnr })
			end)
			lsp_zero.set_sign_icons({
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»",
			})
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "html", "cssls", "jsonls" },
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
					rust_analyzer = function()
						require("lspconfig").rust_analyzer.setup({
							settings = {
								["rust-analyzer"] = {
									check = { command = "clippy" },
								},
							},
						})
					end,
					tsserver = function()
						require("lspconfig").tsserver.setup({
							settings = {
								completions = {
									completeFunctionCalls = true,
								},
							},
						})

						wk.register({
							["<leader>lt"] = {
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
					end,
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local lsp_zero = require("lsp-zero")
			local cmp_action = require("lsp-zero").cmp_action()
			cmp.setup({
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip", keyword_length = 2 },
					-- { name = 'buffer',  keyword_length = 3 },
				},
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
					["<Tab>"] = cmp_action.luasnip_supertab(),
					["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})
		end,
	},
}

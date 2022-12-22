local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup({
	function(use)
		use("wbthomason/packer.nvim")

		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

		use({
			"rose-pine/neovim",
			as = "rose-pine",
			config = function()
				vim.cmd("colorscheme rose-pine")
			end,
		})

		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("ThePrimeagen/harpoon")
		use("mbbill/undotree")
		use("tpope/vim-fugitive")

		use({
			"VonHeikemen/lsp-zero.nvim",
			requires = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },

				-- Autocompletion
				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },

				-- Snippets
				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
			},
		})

		use("numToStr/Comment.nvim")
		use("nvim-tree/nvim-tree.lua")
		use("nvim-tree/nvim-web-devicons")

		use("nvim-lualine/lualine.nvim")

		use("windwp/nvim-autopairs")
		use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

		use("lewis6991/gitsigns.nvim")

		use("lukas-reineke/indent-blankline.nvim")

		use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
		use({ "famiu/bufdelete.nvim" })

		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({})
			end,
		})

		use("jose-elias-alvarez/null-ls.nvim")
		use("jayp0521/mason-null-ls.nvim")

		use({
			"akinsho/toggleterm.nvim",
			tag = "*",
			config = function()
				require("toggleterm").setup()
			end,
		})

		use({ "kevinhwang91/nvim-bqf", ft = "qf" })
		use({
			"junegunn/fzf",
			run = function()
				vim.fn["fzf#install"]()
			end,
		})

		use({
			"sudormrfbin/cheatsheet.nvim",
			requires = {
				{ "nvim-telescope/telescope.nvim" },
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
			},
		})

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})

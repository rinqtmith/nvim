return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
      border = "rounded",
    },
  },
  config = function(_, opts)
    local servers = {
      "lua_ls",
      "rust_analyzer",
      "tsserver",
      "html",
      "cssls",
      "jsonls",
      "taplo",
      "tailwindcss",
    }
    local extras = {
      "eslint_d",
      "prettier",
      "stylua",
    }
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })
    require("mason-tool-installer").setup({
      ensure_installed = extras,
    })
  end,
}

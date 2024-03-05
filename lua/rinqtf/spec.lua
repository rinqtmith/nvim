SERVERS = {
	"lua_ls",
	"rust_analyzer",
	"tsserver",
	"html",
	"cssls",
	"jsonls",
	"taplo",
	"tailwindcss",
	"gopls",
}
EXTRAS = {
	"eslint_d",
	"prettier",
	"stylua",
}

-- taken from launch.nvim (Christian Chiarulli)
LAZY_PLUGIN_SPEC = {}

function spec(item)
	table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

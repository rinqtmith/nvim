return {
	"echasnovski/mini.starter",
	version = false,
	config = function()
		local starter = require("mini.starter")
		local logo = table.concat({
			[[
██████╗ ██╗███╗   ██╗ ██████╗ ████████╗███████╗
██╔══██╗██║████╗  ██║██╔═══██╗╚══██╔══╝██╔════╝
██████╔╝██║██╔██╗ ██║██║   ██║   ██║   █████╗  
██╔══██╗██║██║╚██╗██║██║▄▄ ██║   ██║   ██╔══╝  
██║  ██║██║██║ ╚████║╚██████╔╝   ██║   ██║     
╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚══▀▀═╝    ╚═╝   ╚═╝     
		]],
		}, "\n")
		local new_section = function(name, action, section)
			return { name = name, action = action, section = section }
		end
		starter.setup({
			evaluate_single = true,
			header = logo,
			items = {
				new_section("Find file", "Telescope find_files", "Telescope"),
				new_section("Recent files", "Telescope oldfiles", "Telescope"),
				new_section("Grep text", "Telescope live_grep", "Telescope"),
				new_section("Lazy", "Lazy", "Config"),
				new_section("New file", "ene | startinsert", "Built-in"),
				new_section("Quit", "qa", "Built-in"),
			},
		})
	end,
}

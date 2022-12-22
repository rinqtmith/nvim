-- import comment plugin safely
local setup, cheatsheet = pcall(require, "cheatsheet")
if not setup then
	return
end

-- enable comment
cheatsheet.setup()

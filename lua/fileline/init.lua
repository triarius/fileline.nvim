local construct = require("fileline.construct")

local M = {}

function M.setup(args)
	vim.api.nvim_create_user_command("Fileline", function()
		local fileline = construct.fileline()
		vim.fn.setreg("+", fileline)
	end, {})
end

return M

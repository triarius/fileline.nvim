local construct = require("fileline.construct")

local M = {}

function M.setup(args)
	local destination_register = args["destination_register"] or "+"

	vim.api.nvim_create_user_command("Fileline", function()
		local fileline = construct.fileline()
		vim.fn.setreg(destination_register, fileline)
	end, {})
end

return M

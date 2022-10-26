local construct = require("fileline.construct")
local open_file = require("fileline.open_file")

local M = {}

function M.setup(args)
	local args = args or {}

	local destination_register = args.copy.destination_register or "+"

	vim.api.nvim_create_user_command("Fileline", function()
		local fileline = construct()
		vim.fn.setreg(destination_register, fileline)
	end, {})

	local grp = vim.api.nvim_create_augroup("fileilne", {})

	vim.api.nvim_create_autocmd("BufNewFile", {
		pattern = "*",
		group = grp,
		callback = open_file,
	})

	vim.api.nvim_create_autocmd("BufRead", {
		pattern = "*",
		group = grp,
		callback = open_file,
	})
end

return M

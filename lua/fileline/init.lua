local construct = require("fileline.construct")
local github_perma = require("fileline.github_perma")
local open_file = require("fileline.open_file")

local M = {}

function M.setup(args)
	local args = args or {}

	local copy = args.copy or {}
	local destination_register = copy.destination_register or "+"

	vim.api.nvim_create_user_command("Fileline", function()
		local fileline = construct()
		vim.fn.setreg(destination_register, fileline)
	end, {})

	vim.api.nvim_create_user_command("GHPerma", function(t)
		local fileline = github_perma(t.line1, t.line2)
		vim.fn.setreg(destination_register, fileline)
	end, { range = true })

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

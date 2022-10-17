local M = {}

M.get_fileline = function()
	local filename = vim.fn.expand("%:~:.")
	local l, c = unpack(vim.api.nvim_win_get_cursor(0))
	local fileline = filename .. ":" .. l .. ":" .. c
	return fileline
end

return M

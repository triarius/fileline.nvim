local M = {}

M.get_fileline = function()
	local filename = vim.fn.expand("%:~:.")
	local l, c = unpack(vim.api.get_win_cursor)
	local fileline = filename .. ":" .. l .. ":" .. c
	return fileline
end

return M

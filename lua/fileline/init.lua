local M = {}

M.get_fileline = function()
	local filename = vim.fn.expand("%:~:.")
	local l, c = unpack(vim.api.nvim_win_get_cursor(0))
	local fileline = filename .. ":" .. l .. ":" .. c
	return fileline
end

M.parse_filename = function(filename)
	local f, l, c = string.match(filename, "^(.*):(%d+):(%d+)$")

	if f ~= nil then
		return {
			filename = f,
			line = tonumber(l),
			column = tonumber(c),
		}
	end

	f, l = string.match(filename, "^(.*):(%d+)$")

	if f ~= nil then
		return {
			filename = f,
			line = tonumber(l),
			column = -1,
		}
	end

	return {
		filename = f,
		line = tonumber(l),
		column = -1,
	}
end

return M

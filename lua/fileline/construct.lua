local function standard(filename, line, column)
	return filename .. ":" .. line .. ":" .. column
end

return function()
	local filename = vim.fn.expand("%:~:.")
	local line, column = unpack(vim.api.nvim_win_get_cursor(0))
	return standard(filename, line, column)
end

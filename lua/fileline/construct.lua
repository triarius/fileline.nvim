return function()
	local filename = vim.fn.expand("%:~:.")
	local l, c = unpack(vim.api.nvim_win_get_cursor(0))
	return filename .. ":" .. l .. ":" .. c
end

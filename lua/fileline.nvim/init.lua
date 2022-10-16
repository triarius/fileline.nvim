local function get_fileline()
	local filename = vim.fn.expand("%:~:.")
	local l, c = unpack(vim.api.get_win_cursor)
	local fileline = filename .. ":" .. l .. ":" .. c
	return fileline
end

return {
	get_fileline = get_fileline,
}

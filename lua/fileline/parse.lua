-- returns a table with the keys
-- filename = the name of the file
-- line = the line number (if any) or -1
-- column = the column number (if any) or -1
return function(filename)
	local matches = vim.fn.matchlist(filename, [[\v^(.{-})(:(\d+))?(:(\d+))?$]])
	return {
		filename = matches[2],
		line = tonumber(matches[4]),
		column = tonumber(matches[6]),
	}
end

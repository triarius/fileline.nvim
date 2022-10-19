-- returns a table with the keys
-- filename = the name of the file
-- line = the line number (if any) or -1
-- column = the column number (if any) or -1
return function(filename)
	-- reverse the string to exploit greedy matching
	local reversed = string.reverse(filename)
	local matches = vim.fn.matchlist(reversed, [[\v((\d+):)?((\d+):)?(.*)]])
	return {
		filename = string.reverse(matches[6]),
		line = tonumber(string.reverse(matches[4])),
		column = tonumber(string.reverse(matches[2])),
	}
end

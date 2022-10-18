return function(filename)
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

local parse = require("fileline.parse")

-- Check if the file in the fileline is openable
-- This means we should not try to move the cursor
local function check_fileline(fileline)
	if vim.fn.filereadable(fileline.original_filename) == 0 then
		return fileline
	end
	return {
		original_filename = fileline.original_filename,
		filename = fileline.original_filename,
	}
end

local function replace_buf(fileline)
	local bufnr = vim.api.nvim_get_current_buf()
	vim.cmd.edit(fileline.filename)
	vim.api.nvim_buf_delete(bufnr, {})
	return fileline
end

local function move_cursor(fileline)
	local line = fileline.line or 1
	local column = fileline.column or 0
	vim.api.nvim_win_set_cursor(0, { line, column })
end

return function(buf)
	local fileline = parse(buf.file)

	fileline = check_fileline(fileline)

	if fileline.filename == fileline.original_filename then
		return
	end

	replace_buf(fileline)
	move_cursor(fileline)
end

local Job = require("plenary.job")

local function github(repo_url, commit, filename, line1, line2)
	local permalink = repo_url .. "/blob/" .. commit .. "/" .. filename .. "#L" .. line1
	if line1 == line2 then
		return permalink
	end
	return permalink .. "-L" .. line2
end

return function(line1, line2)
	local filename = vim.fn.expand("%:~:.")
	local repo_url = Job:new({ command = "gh", args = { "browse", "--no-browser" } }):sync()[1]
	local commit = Job:new({ command = "git", args = { "rev-parse", "HEAD" } }):sync()[1]
	return github(repo_url, commit, filename, line1, line2)
end

local M = {}

M.cmd = function(events, pattern, group, command)
	vim.api.nvim_create_autocmd(events, {
		pattern = pattern,
		group = group,
		callback = command,
	})
end

M.group = function(name)
	vim.api.nvim_create_augroup(name, { clear = true })
	return name
end

return M

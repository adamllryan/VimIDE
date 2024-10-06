local function get_if_available(names)
	for _, name in ipairs(names) do
		local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
		if vim_ok then
			return name
		end
	end
	return "default"
end

local M = {}

M.set_color = function(schemes)
	vim.cmd.colorscheme(get_if_available(schemes))
end

return M

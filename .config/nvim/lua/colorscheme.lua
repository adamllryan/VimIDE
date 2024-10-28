local function get_if_available(names)
	for _, name in ipairs(names) do
		local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
		if vim_ok then
			return name
		end
	end
	return "default"
end

-- Set colorscheme from hierarchy list

local schemes = {
	"carbonfox"
}

vim.cmd("set background=dark")

vim.cmd.colorscheme(get_if_available(schemes))

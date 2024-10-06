local function get_if_available(names)
    for _, name in ipairs(names) do
        local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
        if vim_ok then
            return name
        end
    end
    return "default"
end

local function set_color(schemes)
    vim.cmd.colorscheme(get_if_available(schemes))
end

-- Set colorscheme from hierarchy list

local schemes = {
    "carbonfox",
    "habamax"
}

vim.cmd("set background=dark")

set_color(schemes)

local map = require('keys').map
map("n", "<leader>L", require("lazy").show, "Show Lazy")
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", "Write file")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("i", "<S-CR>", function()
    if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept_line()
        print("Accepted suggestion")
    end
end, "Accept copilot suggestion")

map("n", "<C-/>", "<cmd>nohlsearch<cr>", "Clear last search")

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
map("n", "<C-=>", function()
    change_scale_factor(1.1)
end, "Increase scale factor")
map("n", "<C-->", function()
    change_scale_factor(0.9)
end, "Decrease scale factor")

map({ "n", "v" }, "<tab>", "<cmd>Neotree toggle left last<cr>", "Toggle file explorer")

map("n", "t", "<cmd>ToggleTerm direction=horizontal<cr>", "Toggle terminal")
map("t", "<esc>", "<C-\\><C-n>", "Exit terminal mode")
map({ "t", "n" }, "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", "Toggle terminal")

map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

map("n", "<S-l>", ":bnext<CR>", "Next tab")
map("n", "<S-h>", ":bprevious<CR>", "Previous tab")

-- experimental

vim.keymap.set("n", "<C-t>", function()
    require("menu").open("default")
end, {})

vim.keymap.set("n", "<RightMouse>", function()
    vim.cmd.exec '"normal! \\<RightMouse>"'

    local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
    require("menu").open(options, { mouse = true })
end, {})

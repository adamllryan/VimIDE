local map = require('keys').map

-- Lazy keybinds

map("n", "<leader>L", require("lazy").show, "Show Lazy")

-- Simple shortcuts

map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", "Write file")

-- Indentation keybinds

map("v", "<", "<gv")
map("v", ">", ">gv")

-- Copilot keybinds

map("i", "<S-CR>", function()
    if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept_line()
        print("Accepted suggestion")
    end
end, "Accept copilot suggestion")

-- Clear highlights after search

map("n", "<C-/>", "<cmd>nohlsearch<cr>", "Clear last search")

-- Neovide keybinds

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

-- Neotree keybinds

map({ "n", "v" }, "<tab>", "<cmd>Neotree toggle left last<cr>", "Toggle file explorer")

-- Terminal keybinds

map("n", "t", "<cmd>ToggleTerm direction=horizontal<cr>", "Toggle terminal")
map("t", "<esc>", "<C-\\><C-n>", "Exit terminal mode")
map({ "t", "n" }, "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", "Toggle terminal")

-- Navigate windows

map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- Terminal Jump to window

map("t", "<C-h>", "<C-\\><C-n><C-w><C-h>", "Navigate windows to the left")
map("t", "<C-j>", "<C-\\><C-n><C-w><C-j>", "Navigate windows down")
map("t", "<C-k>", "<C-\\><C-n><C-w><C-k>", "Navigate windows up")
map("t", "<C-l>", "<C-\\><C-n><C-w><C-l>", "Navigate windows to the right")

-- Change buffer like tabs

map("n", "<S-l>", ":bnext<CR>", "Next tab")
map("n", "<S-h>", ":bprevious<CR>", "Previous tab")

-- Menu keybinds

vim.keymap.set("n", "<C-t>", function()
    require("menu").open("default")
end, {})

vim.keymap.set("n", "<RightMouse>", function()
    vim.cmd.exec '"normal! \\<RightMouse>"'

    local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
    require("menu").open(options, { mouse = true })
end, {})


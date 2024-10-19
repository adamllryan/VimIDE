local map = require("keys").map

-- Lazy keybinds

map("n", "<leader>L", require("lazy").show, "Show Lazy")

-- Simple shortcuts

map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", "Write file")

-- Indentation keybinds

map("v", "<", "<gv")
map("v", ">", ">gv")

-- Copilot keybinds

local copilot = pcall(require, "copilot")

if copilot then
	map("i", "<S-CR>", function()
		if require("copilot.suggestion").is_visible() then
			require("copilot.suggestion").accept_line()
			print("Accepted suggestion")
		end
	end, "Accept copilot suggestion")
end

local localCopilot = pcall(require, "llm")

if localCopilot then
    map("i", "<S-CR>", require("llm").complete, "Accept copilot suggestion")
end

-- Harpoon bindings

local harpoon = require("harpoon")

map("n", "<leader>a", function() harpoon:list():add() end, "Add current file to Harpoon")
map("n", "<leader>A", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Toggle Harpoon menu")

map("n", "<leader>1", function() harpoon:list():select(1) end, "Select Harpoon list 1")
map("n", "<leader>2", function() harpoon:list():select(2) end, "Select Harpoon list 2")
map("n", "<leader>3", function() harpoon:list():select(3) end, "Select Harpoon list 3")
map("n", "<leader>4", function() harpoon:list():select(4) end, "Select Harpoon list 4")
map("n", "<leader>5", function() harpoon:list():select(5) end, "Select Harpoon list 5")

-- Toggle previous & next buffers stored within Harpoon list

map("n", "<C-S-P>", function() harpoon:list():prev() end)
map("n", "<C-S-N>", function() harpoon:list():next() end)

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
	vim.cmd.exec('"normal! \\<RightMouse>"')

	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, { mouse = true })
end, {})

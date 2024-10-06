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

map("n", "<leader>ga", "<cmd>Git add %<cr>", "Stage the current file")
map("n", "<leader>gb", "<cmd>Git blame<cr>", "Show the blame")

map({ "n", "v" }, "<tab>", "<cmd>Neotree toggle float last<cr>", "Toggle file explorer")

map("n", "t", "<cmd>ToggleTerm direction=horizontal<cr>", "Toggle terminal")
map("t", "<esc>", "<C-\\><C-n>", "Exit terminal mode")
map({ "t", "n" }, "<C-\\>", "<cmd>ToggleTerm direction=float<cr>", "Toggle terminal")

return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
        "nvim-telescope/telescope.nvim",
	},
	opts = {
		-- Add languages to be installed here that you want installed for treesitter
		ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"vue",
		},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true, disable = { "python" } },
	},
	config = function(_, opts)
		-- pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		require("nvim-treesitter.configs").setup(opts)
	end,
}

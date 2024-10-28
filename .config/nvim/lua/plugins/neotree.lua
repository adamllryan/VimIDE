return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim", 
    },
    config = function()
        require("neo-tree").setup({
            enable_opened_markers = true,
            close_if_last_window = true,
            hide_root_node = true,
            popup_border_style = "rounded",
            sort_case_insensitive = true,
            source_selector = {
                winbar = true,
                statusline = true,
            },
            name = {
                trailing_slash = true,
                highlight_opened_files = true,
            },
            window = {
                mappings = {
                    ["<space>"] = {
                        "close_window",
                    },
                    ["s"] = {},
                    ["S"] = {},
                    ["C"] = {},
                    ["z"] = {},
                    ["t"] = {},
                    ["f"] = {},
                    ["#"] = {},
                    ["C-b"] = {},
                    ["C-f"] = {},
                    ["C-x"] = {},
                    ["l"] = {},
                    ["e"] = {},
                },
            },
        })
    end,
}

return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = vim.g.colors_name,
                    component_separators = "",
                    globalstatus = true,
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            separator = { left = "" },
                            right_padding = 2,
                        },
                    },
                    lualine_b = {
                        "branch"
                    },
                    lualine_c = { "diff", { "filename", file_status = true, path = 1 } },
                    lualine_x = {
                        "encoding",
                        "filesize",
                    },
                    lualine_y = { "filetype", "progress" },
                    lualine_z = {
                        {
                            "location",
                            separator = { right = "" },
                            left_padding = 2,
                        },
                    },
                },
                inactive_sections = {
                    lualine_a = { "filename" },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { "location" },
                },
                extensions = { "neo-tree", "lazy" },
            })
        end,
    },
    { "rcarriga/nvim-notify" },
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {},
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            delay = 0,
            preset = "helix",
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = true })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "mrjones2014/legendary.nvim",
        priority = 10000,
        lazy = false,
        dependencies = { "kkharji/sqlite.lua", "stevearc/dressing.nvim" },
        extensions = {
            which_key = {
                auto_register = true,
                opts = {},
                do_binding = false,
                use_groups = true,
            },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            local highlightBg = {
                "RainbowRedBg",
                "RainbowYellowBg",
                "RainbowBlueBg",
                "RainbowOrangeBg",
                "RainbowGreenBg",
                "RainbowVioletBg",
                "RainbowCyanBg",
            }

            local highlightFg = {
                "RainbowRedFg",
                "RainbowYellowFg",
                "RainbowBlueFg",
                "RainbowOrangeFg",
                "RainbowGreenFg",
                "RainbowVioletFg",
                "RainbowCyanFg",
            }


            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRedFg", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellowFg", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlueFg", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrangeFg", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreenFg", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowVioletFg", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyanFg", { fg = "#00FFFF" })

                vim.api.nvim_set_hl(0, "RainbowRedBg", { fg = "#70363B" })
                vim.api.nvim_set_hl(0, "RainbowYellowBg", { fg = "#73603E" })
                vim.api.nvim_set_hl(0, "RainbowBlueBg", { fg = "#4C623D" })
                vim.api.nvim_set_hl(0, "RainbowOrangeBg", { fg = "#2B5B61" })
                vim.api.nvim_set_hl(0, "RainbowGreenBg", { fg = "#315878" })
                vim.api.nvim_set_hl(0, "RainbowVioletBg", { fg = "#633C6F" })
                vim.api.nvim_set_hl(0, "RainbowCyanBg", { fg = "#008888" })
            end)

            --vim.g.rainbow_delimiters = { highlight = highlightFg }
            require("ibl").setup({
                indent = { highlight = highlightBg },
                --scope = { highlight = highlightFg },
            })
            -- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end,
    },

}

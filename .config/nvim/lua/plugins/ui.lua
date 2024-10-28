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
                        "branch",
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
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                timeout = 3000,
                render = "minimal",
                stages = "slide",
            })
            vim.notify = require("notify")
        end,
        opts = {
            timeout = 3000,
            render = "compact",
        }
    },
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
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#70363B" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#73603E" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#4C623D" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#2B5B61" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#315878" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#633C6F" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#008888" })
            end)

            require("ibl").setup({
                indent = {
                    highlight = highlight,
                    tab_char = "|",
                    repeat_linebreak = false,
                },
            })
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    }
}

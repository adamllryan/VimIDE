return {
    "NvChad/menu",
    lazy = true,
    dependencies = {
        "NvChad/volt",
        {
            "stevearc/conform.nvim",
            opts = {
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    sh = { "shfmt" },
                    go = { "gofmt", "goimports" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    html = { "prettier" },
                    css = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                    rust = { "rustfmt" },
                    cpp = { "clang-format" },
                    c = { "clang-format" },
                    java = { "google-java-format" },
                    kotlin = { "ktlint" },
                    php = { "php-cs-fixer" },
                    ruby = { "rufo" },
                    sql = { "sqlformat" },
                },
            },
        },
    },
}

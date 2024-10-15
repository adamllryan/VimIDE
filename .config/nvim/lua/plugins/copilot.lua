local use_local = false
local debounce = 75
local accept_keymap = "<S-CR>"

if use_local then
    return {
        'huggingface/llm.nvim',
        opts = {
            backend = "ollama",
            model = "deepseek-coder",
            url = "http://localhost:11434", -- llm-ls uses "/api/generate"
            -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
            request_body = {
                -- Modelfile options for the model you use
                options = {
                    temperature = 0.2,
                    top_p = 0.95,
                    max_new_tokens = 15
                }
            },
            accept_keymap = accept_keymap,
            debounce = debounce,

        }
    }
else
    return {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        opts = {
            panel = {
                enabled = true,
                auto_refresh = true,
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                accept = false,
                debounce = debounce,
                keymap = {
                    accept = accept_keymap,
                }
            },
            filetypes = {
                ["."] = true,
            },
        },
    }
end

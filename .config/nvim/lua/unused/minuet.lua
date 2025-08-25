return {
    'milanglacier/minuet-ai.nvim',
    config = function()
        require('minuet').setup {
            virtualtext = {
                auto_trigger_ft = {},
                keymap = {
                    accept = '<A-A>',
                    accept_line = '<A-a>',
                    accept_n_lines = '<A-z>',
                    prev = '<A-[>',
                    next = '<A-]>',
                    dismiss = '<A-e>',
                },
            },
            provider = 'openai_fim_compatible',
            provider_options = {
                openai_fim_compatible = {
                    api_key = 'TERM',
                    name = 'Ollama',
                    end_point = 'http://localhost:11434/v1/completions',
                    model = 'phi',
                    optional = {
                        max_tokens = 128,
                        top_p = 0.95,
                    },
                },
            },
            context_window = 4096,
            throttle = 500,
            debounce = 300,
        }
    end,
}

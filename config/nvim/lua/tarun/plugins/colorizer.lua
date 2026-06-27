return {
    {
        "NvChad/nvim-colorizer.lua",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            local colorizer = require("colorizer")

            colorizer.setup({
                filetypes = {
                    "html",
                    "css",
                    "javascript",
                    "typescript",
                    "javascriptreact",
                    "typescriptreact",
                    "vue",
                    "svelte",
                    "astro",
                    -- TOML needs its own table inside filetypes if you want specific parsers
                    toml = { 
                        parsers = { 
                            hex = { enable = true },
                            names = false 
                        } 
                    },
                },
                user_commands = true,
                -- "options" usually wraps global defaults
                user_default_options = {
                    names = true, -- Highlight color names like 'Blue'
                    RGB = true,   -- #RGB hex codes
                    RRGGBB = true, -- #RRGGBB hex codes
                    AARRGGBB = true, -- #AARRGGBB hex codes
                    rgb_fn = true, -- CSS rgb() and rgba() functions
                    hsl_fn = true, -- CSS hsl() and hsla() functions
                    css = true,    -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
                    -- Tailwind support
                    tailwind = true, 
                    sass = { enable = false },
                    virtualtext = "■",
                },
            })
        end,
    },
}

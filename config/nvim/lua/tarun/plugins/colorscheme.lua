-- Simple Comment. No use
return {
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        opts = {
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
                functions = { italic = false },
                variables = { italic = false },
            },
        },
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        config = function()
            require("rose-pine").setup({
                styles = {
                    italic = false,
                },
            })
        end,
    },
    {
        "vague2k/vague.nvim",
        lazy = false,
        config = function()
            require("vague").setup({
                style = {
                    boolean = "none",
                    number = "none",
                    float = "none",
                    error = "none",
                    comments = "none",
                    conditionals = "none",
                    functions = "none",
                    headings = "none",
                    identifiers = "none",
                    keywords = "none",
                    keyword_return = "none",
                    keywords_loop = "none",
                    keywords_label = "none",
                    keywords_exception = "none",
                    macros = "none",
                    operators = "none",
                    preproc = "none",
                    regex = "none",
                    strings = "none",
                    tag = "none",
                    type = "none",
                    variables = "none",
                },
            })
        end,
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onedark").setup({
                style = "warmer",
                code_style = {
                    comments = "none",
                    keywords = "none",
                    functions = "none",
                    strings = "none",
                    variables = "none",
                },
            })
            vim.opt.background = "dark"
            require("onedark").load()
        end,
    },
{
    "ramojus/mellifluous.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("mellifluous").setup({
        colorset = "kanagawa_dragon",

        kanagawa_dragon = {
          color_overrides = {
            dark = {
              -- Mountain's near-black background, everything else stays kanagawa_dragon
              bg = function(bg)
                return require("mellifluous.color").new("#0F0F0F")
              end,

              -- Optionally tweak individual syntax colors here.
              -- These are already kanagawa_dragon defaults — uncomment & change what you want.
              -- colors = function(colors)
              --   return {
              --     -- fg           = "#DCD7BA", -- fujiWhite (identifiers)
              --     -- main_keywords = "#E46876", -- waveRed (if/for/return)
              --     -- other_keywords = "#957FB8", -- oniViolet (other keywords)
              --     -- functions    = "#7E9CD8", -- crystalBlue
              --     -- types        = "#7AA89F", -- waveAqua2
              --     -- strings      = "#98BB6C", -- springGreen
              --     -- constants    = "#FFA066", -- surimiOrange
              --     -- comments     = "#727169", -- fujiGray
              --     -- operators    = "#C0A36E", -- boatYellow2
              --   }
              -- end,
            },
          },
        },

                styles = {
                    comments  = { italic = false },
                    keywords  = { italic = false },
                    functions = { italic = false },
                    strings   = { italic = false },
                    variables = { italic = false },
                    constants = { italic = false },
                    numbers   = { italic = false },
                    operators = { italic = false },
                    types     = { italic = false },
                },
            })
        end,
    },
}

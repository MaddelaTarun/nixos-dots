return {
    -- Mini Nvim (Optional: only needed if you want the full suite)
    { "echasnovski/mini.nvim", version = false },

    -- Surround
    {
        "echasnovski/mini.surround",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            highlight_duration = 300,
            mappings = {
                add = 'sa',
                delete = 'ds',
                find = 'sf',
                find_left = 'sF',
                highlight = 'sh',
                replace = 'ca',
                update_n_lines = 'sn',
                suffix_last = 'l',
                suffix_next = 'n',
            },
            n_lines = 20,
            respect_selection_type = false,
            search_method = 'cover',
            silent = false,
        },
    },

    -- Trailspace
    {
        "echasnovski/mini.trailspace",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local miniTrailspace = require("mini.trailspace")
            miniTrailspace.setup({
                only_in_normal_buffers = true,
            })
            vim.keymap.set("n", "<leader>cw", function() miniTrailspace.trim() end, { desc = "Erase Whitespace" })

            vim.api.nvim_create_autocmd("CursorMoved", {
                pattern = "*",
                callback = function()
                    miniTrailspace.unhighlight()
                end,
            })
        end,
    },

    -- Split & Join
    {
        "echasnovski/mini.splitjoin",
        config = function()
            local miniSplitJoin = require("mini.splitjoin")
            miniSplitJoin.setup({
                mappings = { toggle = "" }, -- Correctly disabled default toggle
            })
            vim.keymap.set({ "n", "x" }, "sj", function() miniSplitJoin.join() end, { desc = "Join arguments" })
            vim.keymap.set({ "n", "x" }, "sk", function() miniSplitJoin.split() end, { desc = "Split arguments" })
        end,
    },
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>f", group = "file/format" },
      { "<leader>s", group = "split" },
      { "<leader>t", group = "tabs" },
      { "<leader>p", group = "search/paste" },
      { "<leader>c", group = "code/color" },
      { "<leader>v", group = "lsp/visual" },
      { "<leader>r", group = "rename/restart" },
      { "<leader>d", group = "diagnostics" },
      { "<leader>l", group = "lsp toggle" },
    })
  end,
}

vim.cmd("let g:netrw_banner = 0")


vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent= true
vim.opt.smartindent= true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.backspace = {"start", "eol", "indent"}

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true

vim.opt.mouse = "a"
vim.g.editorconfig = true

-- Global autocmd to disable italics in all colorschemes
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local groups = {
      "Comment",
      "Keyword",
      "Statement",
      "Conditional",
      "Repeat",
      "Label",
      "Exception",
      "Operator",
      "Type",
      "StorageClass",
      "Structure",
      "Typedef",
      "Identifier",
      "Function",
      "@keyword",
      "@comment",
      "@type",
      "@function",
      "@variable",
      "@parameter",
      "@property",
      "@field",
      "@method",
      "@constant",
      "@string",
      "@namespace",
      "@label",
      "@operator",
      "@include",
      "@repeat",
      "@conditional",
      "@exception",
      "@storageclass",
      "@structure",
      "@typedef",
      "@punctuation.delimiter",
      "@punctuation.bracket",
      "@punctuation.special",
    }
    for _, group in ipairs(groups) do
      local hl = vim.api.nvim_get_hl(0, { name = group })
      if hl.italic then
        hl.italic = false
        vim.api.nvim_set_hl(0, group, hl)
      end
    end
  end,
})


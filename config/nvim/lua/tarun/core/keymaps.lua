local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", 
        { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", 
        { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", 
        { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", 
        { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- CLIPBOARD SETTINGS

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dp', opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-c>", ":nohl<CR>", 
        { desc = "Clear search hl", silent = true })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "x", '"_x', opts)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 
        { desc = "Replace word cursor is on globally" })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", 
        { silent = true, desc = "makes file executable" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")   
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") 
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")     
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")     
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") 

vim.keymap.set("n", "<leader>sv", "<C-w>v", 
        { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", 
        { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", 
        { desc = "Make splits equal size" }) 
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", 
        { desc = "Close current split" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })


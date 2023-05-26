-- diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
vim.keymap.set("n", "<leader>dd", function()
	vim.diagnostic.disable()
end, { desc = "[D]iagnostics [D]isable" })
vim.keymap.set("n", "<leader>de", function()
	vim.diagnostic.enable()
end, { desc = "[D]iagnostics [E]nable" })

-- terminal keymaps
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { silent = true, noremap = true })

-- toggle relative and absolute line numbers
vim.keymap.set("n", "<leader>ln", function()
	vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative [L]ine [N]umbers" })

-- add new line above and below
vim.keymap.set("n", "[<Space>", "O<Esc>", { desc = "Add new line above" })
vim.keymap.set("n", "]<Space>", "o<Esc>", { desc = "Add new line below" })

-- move lines up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- move visual block up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move visual block down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move visual block up" })

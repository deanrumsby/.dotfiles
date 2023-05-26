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

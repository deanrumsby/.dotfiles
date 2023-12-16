-- highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- disable line numbers in terminal windows
local vim_term = vim.api.nvim_create_augroup("vim_term", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
		vim.opt_local.signcolumn = "no"
	end,
	group = vim_term,
})

-- reload nvim-tree whenever gitsigns event occurs
vim.api.nvim_create_autocmd("User", {
	pattern = "GitSignsUpdate",
	callback = function()
		require("nvim-tree.api").tree.reload()
	end,
})

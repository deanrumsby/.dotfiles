local indentation = {
	c = 4,
	cpp = 4,
	css = 2,
	java = 4,
	javascript = 2,
	lua = 4,
	python = 4,
	rust = 4,
	typescript = 2,
	typescriptreact = 2,
}

for k, v in pairs(indentation) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = k,
		callback = function()
			vim.bo.tabstop = v
			vim.bo.shiftwidth = v
			vim.bo.softtabstop = v
		end,
	})
end

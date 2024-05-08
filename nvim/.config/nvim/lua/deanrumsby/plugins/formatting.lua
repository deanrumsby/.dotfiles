return {
	-- indentation guides
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- better commenting
	{ "numToStr/Comment.nvim", config = true },

	-- enable non-lsp binaries to hook in to lsp client
	-- for formatting and linting etc
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = false,
		config = function()
			local null_ls = require("null-ls")
			local formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})
			local code_actions_group = vim.api.nvim_create_augroup("LspCodeActions", {})
			null_ls.setup({
				sources = {
					-- lua
					null_ls.builtins.formatting.stylua,
					-- black (python)
					null_ls.builtins.formatting.black,
					-- racket
					null_ls.builtins.formatting.raco_fmt,
					-- prettier
					null_ls.builtins.formatting.prettier,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = formatting_group, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = formatting_group,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format()
							end,
						})
					end
				end,
			})
		end,
	},
}

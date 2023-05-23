return {
	-- auto detect indentation
	"tpope/vim-sleuth",

	-- auto blankline indentation
	"lukas-reineke/indent-blankline.nvim",

	-- better commenting
	"numToStr/Comment.nvim",

	-- enable non-lsp binaries to hook in to lsp client
	-- for formatting and linting etc
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = false,
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				sources = {
					-- lua
					null_ls.builtins.formatting.stylua,
					-- javascript / typescript linting
					null_ls.builtins.diagnostics.eslint_d,
					-- phpcs
					null_ls.builtins.diagnostics.phpcs,
					-- phpcbf
					null_ls.builtins.formatting.phpcbf,
					-- black (python)
					null_ls.builtins.formatting.black,
					-- racket
					null_ls.builtins.formatting.racket_fmt,
				},

				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
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

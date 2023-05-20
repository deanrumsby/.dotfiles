return {
	-- lsp installer/manager
	{
		"williamboman/mason.nvim",
		lazy = false,
		build = ":MasonUpdate",
		config = true,
	},
	-- bridge between mason and lspconfig
	{
		"williamboman/mason-lspconfig",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"tsserver",
				"intelephense",
			},
		},
	},
	-- lsp configs
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{
				-- adds nvim lua options
				"folke/neodev.nvim",
				lazy = false,
				config = true,
			},
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- add bindings for all servers
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						{ desc = "[G]o to [D]eclaration", buffer = ev.buf }
					)
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						{ desc = "[G]o to [D]efinition", buffer = ev.buf }
					)
					vim.keymap.set(
						"n",
						"gi",
						vim.lsp.buf.implementation,
						{ desc = "[G]o to [I]mplementation", buffer = ev.buf }
					)

					vim.keymap.set(
						"n",
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ desc = "[C]ode [A]ction", buffer = ev.buf }
					)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame", buffer = ev.buf })

					vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation", buffer = ev.buf })
					vim.keymap.set(
						"n",
						"<C-k>",
						vim.lsp.buf.signature_help,
						{ desc = "Signature Documentation", buffer = ev.buf }
					)

					vim.keymap.set(
						"n",
						"<leader>D",
						vim.lsp.buf.type_definition,
						{ desc = "[D]efinition", buffer = ev.buf }
					)
					vim.keymap.set(
						"n",
						"gr",
						vim.lsp.buf.references,
						{ desc = "[G]o to [R]eferences", buffer = ev.buf }
					)
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format()
					end, { desc = "[F]ormat", buffer = ev.buf })
				end,
			})
			-- format on save augroup
			local augroup = vim.api.nvim_create_augroup("UserLspConfigFormatOnSave", {})

			-- format on save on_attach
			local format_on_save_on_attach = function(client, bufnr)
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
			end

			-- lua
			lspconfig.lua_ls.setup({
				on_attach = format_on_save_on_attach,
				settings = {
					Lua = {
						runtime = {
							-- neovim lua runtime
							version = "LuaJIT",
						},
						diagnostics = {
							-- get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						-- do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
						format = {
							enable = false,
						},
					},
				},
			})

			-- typescript
			lspconfig.tsserver.setup({
				on_attach = format_on_save_on_attach,
			})

			-- php
			-- work uses phpcs so we need to disable formatting
			lspconfig.intelephense.setup({
				on_init = function(client)
					client.server_capabilities.documentFormattingProvider = false
				end,
			})
		end,
	},
	-- rust-analyzer config
	{
		"simrat39/rust-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			server = {
				on_attach = function(client)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			},
		},
	},
	-- lsp status updates
	{
		"j-hui/fidget.nvim",
		config = true,
	},
}

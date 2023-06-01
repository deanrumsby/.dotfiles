return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
						i = {
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
				pickers = {
					buffers = {
						mappings = {
							n = {
								["<C-b>"] = require("telescope.actions").delete_buffer,
							},
							i = {
								["<C-b>"] = require("telescope.actions").delete_buffer,
							},
						},
					},
				},
			})

			vim.keymap.set(
				"n",
				"<leader>?",
				require("telescope.builtin").oldfiles,
				{ desc = "[?] Find recently opened files" }
			)
			vim.keymap.set(
				"n",
				"<leader><space>",
				require("telescope.builtin").buffers,
				{ desc = "[ ] Find existing buffers" }
			)
			vim.keymap.set("n", "<leader>/", function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sp", require("telescope.builtin").git_files, { desc = "[S]earch [P]roject" })
			vim.keymap.set(
				"n",
				"<leader>sw",
				require("telescope.builtin").grep_string,
				{ desc = "[S]earch current [W]ord" }
			)
			vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set(
				"n",
				"<leader>sd",
				require("telescope.builtin").diagnostics,
				{ desc = "[S]earch [D]iagnostics" }
			)
		end,
	},

	-- fzf-native algorithm for telescope
	-- increases speed
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
}

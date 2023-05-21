return {
	-- git commands
	"tpope/vim-fugitive",

	-- github extras
	"tpope/vim-rhubarb",

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				vim.keymap.set(
					"n",
					"[h",
					require("gitsigns").prev_hunk,
					{ buffer = bufnr, desc = "Go to Previous [H]unk" }
				)
				vim.keymap.set("n", "]h", require("gitsigns").next_hunk, { buffer = bufnr, desc = "Go to Next [H]unk" })
				vim.keymap.set(
					"n",
					"<leader>gp",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "[G]it [P]review Hunk" }
				)
				vim.keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk, {
					buffer = bufnr,
					desc = "[G]it [R]eset Hunk",
				})
			end,
		},
	},
}

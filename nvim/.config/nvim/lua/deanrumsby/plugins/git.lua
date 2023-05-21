return {
	-- git commands
	"tpope/vim-fugitive",

	-- github extras
	"tpope/vim-rhubarb",

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame_opts = {
				delay = 0,
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				vim.keymap.set("n", "[h", gitsigns.prev_hunk, { buffer = bufnr, desc = "Go to Previous [H]unk" })
				vim.keymap.set("n", "]h", require("gitsigns").next_hunk, { buffer = bufnr, desc = "Go to Next [H]unk" })
				vim.keymap.set(
					"n",
					"<leader>gp",
					gitsigns.preview_hunk,
					{ buffer = bufnr, desc = "[G]it [P]review Hunk" }
				)
				vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, {
					buffer = bufnr,
					desc = "[G]it [R]eset Hunk",
				})
				vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, {
					buffer = bufnr,
					desc = "[G]it [R]eset Buffer",
				})
				vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, {
					buffer = bufnr,
					desc = "[G]it [S]tage Hunk",
				})
				vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, {
					buffer = bufnr,
					desc = "[G]it [S]tage Buffer",
				})
				vim.keymap.set("n", "<leader>gu", gitsigns.undo_stage_hunk, {
					buffer = bufnr,
					desc = "[G]it [U]ndo Stage Hunk",
				})
				vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, {
					buffer = bufnr,
					desc = "[G]it [B]lame",
				})
				vim.keymap.set("n", "<leader>gB", function()
					gitsigns.blame_line({ full = true })
				end, {
					buffer = bufnr,
					desc = "[G]it [B]lame (Full)",
				})
			end,
		},
	},
}

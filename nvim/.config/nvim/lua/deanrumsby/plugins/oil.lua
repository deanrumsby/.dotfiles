return {
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({})

			vim.keymap.set("n", "<leader>fb", "<CMD>Oil<CR>", { desc = "Open [F]ile [B]rowser" })
		end,
	},
}

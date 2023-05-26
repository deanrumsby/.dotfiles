return {
	-- nicer terminal ui
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<c-`>]],
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)

			local function lazygit_open()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({
					cmd = "lazygit --use-config-file ~/.config/lazygit/config-nvim.yml",
					direction = "float",
					hidden = true,
				})
				lazygit:open()
			end

			vim.keymap.set("n", "<leader>lg", lazygit_open, { noremap = true, silent = true })
		end,
	},
}

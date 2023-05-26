return {
	-- file tree
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		opts = {
			view = {
				side = "right",
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)
			local api = require("nvim-tree.api")
			vim.keymap.set("n", "<leader>ft", function()
				api.tree.toggle()
			end, { desc = "Toggle [F]ile [T]ree" })
		end,
	},

	-- buffer hotswitching
	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "[H]arpoon [A]dd Mark" })
			vim.keymap.set("n", "<leader>hl", ui.toggle_quick_menu, { desc = "[H]arpoon [L]ist Marks" })

			vim.keymap.set("n", "<leader>1", function()
				ui.nav_file(1)
			end, { desc = "Harpoon File [1]" })
			vim.keymap.set("n", "<leader>2", function()
				ui.nav_file(2)
			end, { desc = "Harpoon File [2]" })
			vim.keymap.set("n", "<leader>3", function()
				ui.nav_file(3)
			end, { desc = "Harpoon File [3]" })
			vim.keymap.set("n", "<leader>4", function()
				ui.nav_file(4)
			end, { desc = "Harpoon File [4]" })
		end,
	},

	-- line numbers auto toggle
	"sitiom/nvim-numbertoggle",
}

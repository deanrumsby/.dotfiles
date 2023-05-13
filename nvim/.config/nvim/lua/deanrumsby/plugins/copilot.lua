return {
	"github/copilot.vim",
	init = function()
		vim.g.copilot_no_tab_map = true
	end,
	config = function()
		vim.cmd([[
			imap <silent><script><expr> <M-space> copilot#Accept("")
		]])
	end,
}

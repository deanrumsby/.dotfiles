-- set space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set default indentation
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4

-- enable line numbers
vim.wo.number = true

-- save undo history
vim.o.undofile = true

-- case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- signcolumn on by default
vim.wo.signcolumn = "yes"

-- enable RGB colors
vim.o.termguicolors = true

-- disable line wrapping
vim.o.wrap = false

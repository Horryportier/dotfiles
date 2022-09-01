vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.hidden = true
vim.opt.scrolloff = 8
vim.opt.syntax = "no"
vim.opt.encoding = "UTF-8"
vim.opt.spell = true
vim.opt.hlsearch = false
vim.opt.colorcolumn = "100"

vim.wo.wrap = false

vim.g.mapleader = " "
vim.g.UltiSnipsEditSplit="vertical"

vim.api.nvim_command('autocmd BufEnter * EnableBlameLine')




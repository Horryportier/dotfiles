--vim.g.tokyonight_transparent_sidebar = true
--vim.g.tokyonight_transparent = true
--vim.opt.background = "dark"
--vim.g.tokyonight_style ="storm"
--vim.g.tokyonight_terminal_colors = true
--vim.g.tokyonight_italic_functions = true

local latte = require("catppuccin.palettes").get_palette "latte"
local frappe = require("catppuccin.palettes").get_palette "frappe"
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local mocha = require("catppuccin.palettes").get_palette "mocha"

vim.cmd("colorscheme catppuccin")

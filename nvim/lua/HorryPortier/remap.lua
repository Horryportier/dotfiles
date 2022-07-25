local nnoremap = require("HorryPortier.keymap").nnoremap
local inoremap = require("HorryPortier.keymap").inoremap
-- Telescope
nnoremap("<leader>ff" ,"<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg" , "<cmd>Telescope live_grep<cr>")
nnoremap( "<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- tag bar 
nnoremap("<F8>", ":TagbarToggle<CR>")

-- change from insert to normal mode
inoremap("jk", "<ESC>")

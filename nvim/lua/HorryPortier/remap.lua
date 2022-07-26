local nnoremap = require("HorryPortier.keymap").nnoremap
local inoremap = require("HorryPortier.keymap").inoremap
-- Telescope
nnoremap("<leader>ff" ,"<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg" , "<cmd>Telescope live_grep<cr>")
nnoremap( "<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap("<F3>", "<cmd>Autoformat<cr>")


-- tag bar
nnoremap("<F8>", ":TagbarToggle<CR>")
-- change from insert to normal mode
inoremap("jk", "<ESC>")

-- save file
nnoremap("<leader><leader>z", "<cmd>:w | so %<cr>")

--docs view
nnoremap("<leader>mm", "<cmd>:DocsViewToggle<cr>")

vim.api.nvim_create_user_command("W", ":w", {})
vim.api.nvim_create_user_command("Q", ":q", {})

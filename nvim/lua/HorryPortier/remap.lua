local nnoremap = require("HorryPortier.keymap").nnoremap
local inoremap = require("HorryPortier.keymap").inoremap

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
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

-- save file nnoremap("<leader><leader>z", "<cmd>:w | so %<cr>") docs view
nnoremap("<leader>mm", "<cmd>:DocsViewToggle<cr>")

-- exp to dir
nnoremap("<leader>zz",  "<cmd>:Explore<cr>")

vim.api.nvim_create_user_command("W", ":w", {})
vim.api.nvim_create_user_command("Q", ":q", {})

-- horpoon
vim.keymap.set("n","<leader>ma",function() mark.add_file() end)
vim.keymap.set("n","<leader>mt",function() ui.toggle_quick_menu() end)
vim.keymap.set("n","<leader>m'",function() ui.nav_file(1) end)
vim.keymap.set("n","<leader>mq",function() ui.nav_file(2) end)
vim.keymap.set("n","<leader>mj",function() ui.nav_file(3) end)
vim.keymap.set("n","<leader>mk",function() ui.nav_file(4) end)


-- switch buffers
nnoremap("<leader>h", "<cmd>:bprevious<cr>")
nnoremap("<leader>l", "<cmd>:bnext<cr>")
nnoremap("<leader>dd", "<cmd>:bdelete<cr>")
nnoremap("<leader>nn", "<cmd>:enew | terminal<cr>")
-- esc terminal mode
--vim.api.nvim_set_keymap("n", "<leader>N", ":tnoremap <C-\><C-n>", {})

-- other
vim.keymap.set("n","<leader>gg",function() vim.lsp.buf.definition() end)
vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})

-- remap
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

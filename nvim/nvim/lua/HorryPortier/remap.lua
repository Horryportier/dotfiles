local nnoremap = require("HorryPortier.keymap").nnoremap
local inoremap = require("HorryPortier.keymap").inoremap
-- Telescope
nnoremap("<leader>ff" ,"<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg" , "<cmd>Telescope live_grep<cr>")
nnoremap( "<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nnoremap("<F3>", "<cmd>Autoformat<cr>")
-- file search
nnoremap("<leader>zz", "<cmd>Ex<cr>")


-- harpoon 
nnoremap("<leader>ma", "<cmd>lua require(\"harpoon.mark\").add_file()<cr>")
nnoremap("<leader>mt", "<cmd>:lua require(\"harpoon.ui\").toggle_quick_menu()<cr>")
nnoremap("<leader>m'", "<cmd>:lua require(\"harpoon.ui\").nav_file(1)<cr>")
nnoremap("<leader>mq", "<cmd>:lua require(\"harpoon.ui\").nav_file(2)<cr>")
nnoremap("<leader>mj", "<cmd>:lua require(\"harpoon.ui\").nav_file(3)<cr>")
nnoremap("<leader>mk", "<cmd>:lua require(\"harpoon.ui\").nav_file(4)<cr>")

-- page jump
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

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
-- Tokyo night transparency bug
vim.api.nvim_create_user_command("TokyoFix", ":so ~/.config/nvim/after/plugin/color.lua", {})

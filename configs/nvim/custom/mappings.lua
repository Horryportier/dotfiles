local M= {}


M.abc = {
  n = {
["<leader>mx"]={function() require("harpoon.mark").add_file() end,"add harpoon link", opts = {nowait = true}},
["<leader>mt"]={function() require("harpoon.ui").toggle_quick_menu()end, "toggle harpoon menu", opts = {nowait = true}},
["<leader>m'"]={function() require("harpoon.ui").nav_file(3)    end,"hr win 1", opts = {nowait = true}},
["<leader>mq"]={function() require("harpoon.ui").nav_file(3)    end,"hr win 2", opts = {nowait = true}},
["<leader>mj"]={function() require("harpoon.ui").nav_file(3)    end,"hr win 3", opts = {nowait = true}},
["<leader>mk"]={function() require("harpoon.ui").nav_file(3)    end,"hr win 4", opts = {nowait = true}},
["<leader>n"]= {":ASToggle<CR>", "toggel auto save", opts = {nowait = true}},
["<leader>tr"] =  {":TroubleToggle<CR>", "toggel trubble view", opts = {nowait = true}}
  },
  i = {
     ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},

  }
}

return M

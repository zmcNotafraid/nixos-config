local map = vim.keymap.set

map("n", "<leader>t", ":NvimTreeToggle<CR>")
map("n", "<leader>/", function() vim.api.nvim_command("CommentToggle") end)
map("n", "<C-E>", ":Telescope oldfiles<CR>")
map("n", "<leader>a", ":Telescope live_grep<CR>")
map("n", "<leader>c", ":!bundle exec rspec %<CR>")

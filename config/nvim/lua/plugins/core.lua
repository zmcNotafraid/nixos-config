return {
  { "nvim-tree/nvim-tree.lua", config = function()
      require("nvim-tree").setup()
      vim.cmd("NvimTreeOpen")
    end
  },
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "lewis6991/gitsigns.nvim", config = true },
  { "windwp/nvim-autopairs", config = true },
  { "tpope/vim-surround" },
}

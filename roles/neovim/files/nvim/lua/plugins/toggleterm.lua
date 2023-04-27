return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = "<C-g>",
        direction = "horizontal",
        shade_terminals = true,
      })
    end,
  },
}

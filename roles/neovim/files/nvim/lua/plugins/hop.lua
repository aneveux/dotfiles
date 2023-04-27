return {
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup()
    end,
    keys = {
      {
        "<leader>h",
        "<cmd>HopChar1<cr>",
        desc = "Hop char",
      },
      {
        "<leader>hw",
        "<cmd>HopWord<cr>",
        desc = "Hop word",
      },
      {
        "<leader>hl",
        "<cmd>HopLine<cr>",
        desc = "Hop line",
      },
    },
  },
}

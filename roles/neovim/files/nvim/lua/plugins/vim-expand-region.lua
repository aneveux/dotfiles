return {
  {
    "terryma/vim-expand-region",
    keys = {
      {
        "<leader>w",
        "<Plug>(expand_region_expand)",
        desc = "Expanding selected region",
      },
      {
        "<leader>-S w",
        "<Plug>(expand_region_shrink)",
        desc = "Shrinking selected region",
      },
    },
  },
}

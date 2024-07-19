return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = true,
  keys = {
    {
      "<leader>gg",
      ":Neogit <Return>",
      desc = "open Neogit",
    },
    -- Diffview
    {
      "<leader>gd",
      ":DiffviewOpen <Return>",
      desc = "open Diffview",
    },
    {
      "<leader>gb",
      ":Telescope git_branches <CR>",
      desc = "close DiffView",
    },
  },
}

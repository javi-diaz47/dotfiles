return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Lua
          null_ls.builtins.formatting.stylua,
          -- Javascript
          --require("none-ls.diagnostics.eslint_d"), -- requires none-ls-extras.nvim
          null_ls.builtins.formatting.prettier,
          -- Python
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          -- Bash
          null_ls.builtins.formatting.shfmt,
        },
      })

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
}

return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
        nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "2", "-ci" } }),
        nls.builtins.formatting.prettier,
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.code_actions.shellcheck,
      },
    }
  end,
}

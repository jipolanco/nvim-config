return {
  "saghen/blink.cmp",
  optional = true,
  dependencies = {
    -- add the legacy cmp source as a dependency for `blink.cmp`
    "kdheepak/cmp-latex-symbols",
  },
  specs = {
    -- install the blink, nvim-cmp compatibility layer
    { "saghen/blink.compat", version = "*", lazy = true, opts = {} },
  },
  opts = {
    sources = {
      -- enable the provider by default
      default = { "latex" },
      -- configure the provider for your new source
      providers = {
        latex = {
          name = "latex_symbols",
          module = "blink.compat.source",
          score_offset = -1,
        },
      },
    },
  },
}

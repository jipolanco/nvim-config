-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "bash-language-server",
        "julia-lsp",
        "lua-language-server",
        "tinymist",  -- typst

        -- install formatters
        "stylua", -- used via conform.nvim
        -- "typstyle",

        -- install debuggers
        -- "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
      -- "julia",
      "latex",
      "typst",
      "fortran",
      "markdown",
    },
    highlight = {
      enable = true,
      disable = {
        "julia",
        "latex",
      },
    },
    indent = {
      enable = true,
      disable = {
        "julia",
        "typst", -- treesitter indentation is not very good with lists
      },
    },
  },
}

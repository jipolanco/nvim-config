-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter
-- --------------------
-- Treesitter customizations are handled with AstroCore
-- as nvim-treesitter simply provides a download utility for parsers

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      auto_install = true, -- enable/disable automatic installation of detected languages
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
        -- disable = {
        --   "julia",
        --   "latex",
        -- },
      },
      indent = {
        enable = true,
        disable = {
          "julia",
          "typst", -- treesitter indentation is not very good with lists
        },
      },
    }
  },
}

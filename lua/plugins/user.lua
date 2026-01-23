-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      -- local luasnip = require "luasnip"
      -- luasnip.filetype_extend("javascript", { "javascriptreact" })
      require("luasnip.loaders.from_vscode").lazy_load(
        -- load snippets in vscode format (.json) in ~/.config/nvim/snippets
        { paths = "./snippets" }
      )
    end,
  },

  -- https://github.com/stevearc/conform.nvim
  -- https://github.com/fredrikekre/Runic.jl?tab=readme-ov-file#neovim
  {
    "stevearc/conform.nvim",
    ft = {"julia"},
    config = function()
      require("conform").setup({
        -- Map of filetype to formatters
        formatters_by_ft = {
          julia = {"runic"},
          typst = {"typstyle"},
        },
        formatters = {
          runic = {
            command = "julia",
            args = function(self, ctx)
              return {"--project=@runic", "--startup-file=no", "-e", "using Runic; exit(Runic.main(ARGS))", "--", "-"}
            end,
            range_args = function(self, ctx)
              local lines = "--lines=" .. ctx.range.start[1] .. ":" .. ctx.range["end"][1]
              return {"--project=@runic", "--startup-file=no", "-e", "using Runic; exit(Runic.main(ARGS))", "--", lines, "-"}
            end
          },
        },
        default_format_opts = {
          -- Increase the timeout in case Runic needs to precompile
          -- (e.g. after upgrading Julia and/or Runic).
          timeout_ms = 20000,
          lsp_format = "fallback", -- use LSP formatter as a fallback
        },
      })
    end,
  },

  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.g.vimtex_view_method = "general"
      vim.g.vimtex_view_general_viewer = "okular"
      vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_fold_manual = 1
    end,
  },

  {
    "jpalardy/vim-slime",
    lazy = false,
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
      vim.g.slime_paste_file = vim.call("tempname")
      vim.g.slime_bracketed_paste = 1
    end,
  },

  -- {
  --   "Saghen/blink.cmp",
  --   opts = {
  --     cmdline = {
  --       enabled = true,
  --       keymap = { preset = 'inherit' },
  --       completion = { menu = { auto_show = true } },
  --     },
  --     sources = {
  --       providers = {
  --         cmdline = {
  --         },
  --       },
  --     },
  --   },
  -- },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "esmuellert/codediff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
  }
}

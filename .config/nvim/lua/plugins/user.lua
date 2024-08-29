-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "       ██╗███████╗██╗  ██╗ █████╗ ███╗   ██╗",
        "       ██║██╔════╝██║  ██║██╔══██╗████╗  ██║",
        "       ██║███████╗███████║███████║██╔██╗ ██║",
        "       ██║╚════██║██╔══██║██╔══██║██║╚██╗██║",
        "       ██║███████║██║  ██║██║  ██║██║ ╚████║",
        "       ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝",
        " ",
        "███████╗ ██████╗  ██████╗ ██╗   ██╗███████╗██████╗ ",
        "██╔════╝ ██╔══██╗██╔═══██╗██║   ██║██╔════╝██╔══██╗",
        "██║  ███╗██████╔╝██║   ██║██║   ██║█████╗  ██████╔╝",
        "██║   ██║██╔══██╗██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗",
        "╚██████╔╝██║  ██║╚██████╔╝ ╚████╔╝ ███████╗██║  ██║",
        " ╚═════╝ ╚═╝  ╚═╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

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
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Tranparency
  {
    "xiyaowong/transparent.nvim",
    cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
    opts = {
      groups = { -- table: default groups
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLine",
        "CursorLineNr",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
        "WinSeparator",
        "NormalFloat",
        "FloatShadow",
        "LineNr",
        "FoldColumn",
        "WinBarNC",
        "WinBar",
        "Stl_3c3836__",
        "Stl928374_3c3836__",
        "Stlbdae93_3c3836__",
        "Stl3c3836_3c3836__",
        "DiagnosticFloatingOk",
        "DiagnosticSignError",
        "DiagnosticSignWarn",
        "DiagnosticSignInfo",
        "DiagnosticSignHint",
        "DiagnosticSignOk",
        "NeoTreeTabInactive",
        "NeoTreeTabSeparatorInactive",
        "NeoTreeTabSeparatorInactive",
        "NoiceAttr179",
        "NoiceAttr181",
        "NoiceCmdlineIcon",
        "NoiceCmdlineIconSearch",
        "NoiceCmdlinePopupBorder",
        "NoiceCmdlinePopupBorderSearch",
        "NoiceCmdlinePopupTitle",
        "NoiceConfirmBorder",
      },
    },
  },
  -- Multi cursor
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  },
  -- Justfile
  {
    "NoahTheDuke/vim-just",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "\\cjustfile", "*.just", ".justfile" },
  },

  -- TODO
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
  },

  -- Notify transparent notification suppression
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },

  {
    "imsnif/kdl.vim",
    opts = {},
    event = "BufEnter *.kdl",
  },

  {
    "neovim/nvim-lspconfig",
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
      },
    },
    opts = {
      servers = {
        hls = {
          filetypes = { "haskell", "lhaskell", "cabal" },
        },
      },
    },
  },
  {
    "tigion/nvim-asciidoc-preview",
    cmd = { "AsciiDocPreview" },
    ft = { "asciidoc" },
    build = "cd server && npm install",
    opts = {
      -- Add user configuration here
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },
      },
      messages = {
        enabled = false,
      },
    },
  },
}

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- devcontainer: workspace used by vscode
    {
      'https://codeberg.org/esensar/nvim-dev-container',
      -- lazy=false,
      config = function()
        require("devcontainer").setup()
      end,
    },
    {
     "folke/trouble.nvim",
     dependencies = { "nvim-tree/nvim-web-devicons" },
     opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
     },
    },
    -- {
    --   "miversen33/netman.nvim",
    --   -- require("netman").setup({
    --   -- }),
    --   config = function ()
    --     require("neo-tree").setup({
    --         sources = {
    --             "filesystem", -- Neotree filesystem source
    --             "netman.ui.neo-tree", -- The one you really care about 😉
    --         },
    --     })
    --   end,
    -- },
    {
      "miversen33/netman.nvim",
      cmd = {
        "NmloadProvider",
        "Nmlogs",
        "Nmdelete",
        "Nmread",
        "Nmwrite",
      },
      opts = {},
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      dependencies = { "netman.nvim" },
      optional = true,
      opts = function(_, opts)
        opts.sources = require("astronvim.utils").list_insert_unique(opts.sources, "netman.ui.neo-tree")
      end,
    },
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
      },
      config = true,
      lazy = false
    },
}

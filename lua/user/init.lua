return {
  -- colorscheme = "nord",
  colorscheme = "sonokai",
  options = {
    g = {
    copilot_no_tab_map = true,
    opilot_assume_mapped = true,
    copilot_tab_fallback = "",
    },
  },

  plugins= {
    -- {
    --   "shaunsingh/nord.nvim",
    --   init = function()
    --     vim.g.nord_disable_background = true
    --   end,
    -- },

  {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
    {
      "sainnhe/sonokai",
      init = function() -- init function runs before the plugin is loaded
        vim.g.sonokai_style = "shusia"
        vim.g.sonokai_transparent_background = 2
      end,
    },

    {
     "goolord/alpha-nvim",
      opts = function(_, opts) -- override the options using lazy.nvim
        opts.section.header.val = { -- change the header section value
        "   █████    ██   ██  ███    ███ ██    ██ ████████",
        "  ██   ██ ████ ████  ████  ████  ██  ██     ██   ",
        "  ███████   ██   ██  ██ ████ ██   ████      ██   ",
        "  ██   ██   ██   ██  ██  ██  ██    ██       ██   ",
        "  ██   ██   ██   ██  ██      ██    ██       ██   ",
        "",  
        "                      My Custom                  ",
        "                  Dashboard Header               ",
        }
      end,
    },
    {
   'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function(plugin, opts)
    require('copilot').setup({
      suggestion = {
        auto_trigger = true,
        accept = "<fn-l>",
        accept_word = false,
        accept_line = false,
        next = "<fn-]>",
        prev = "<fn-[>",
        dismiss = "<C-]>",
        },
      })
    end
  },
},
  polish = function()
   local copilot_options = { silent = true, expr = true, script = true } 
   vim.api.nvim_set_keymap("i", "<C-l>", "copilot#Accept(<Tab>)", copilot_options)
  end,
}

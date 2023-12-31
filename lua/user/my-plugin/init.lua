return {
  init = {
    -- You can disable default plugins as follows:
    ["goolord/alpha-nvim"] = { disable = true },

    -- You can also add new plugins here as well:
    -- Add plugins, the packer syntax without the "use"
    -- { "andweeb/presence.nvim" },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },

    -- We also support a key value style plugin definition similar to NvChad:
    -- ["ray-x/lsp_signature.nvim"] = {
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
  },
  -- All other entries override the require("<key>").setup({...}) call for default plugins
  ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
    -- config variable is the default configuration table for the setup functino call
    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
    }
    -- set up null-ls's on_attach function
    -- NOTE: You can remove this on attach function to disable format on save
    config.on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.api.nvim_create_autocmd("BufWritePre", {
          desc = "Auto format before save",
          pattern = "<buffer>",
          callback = vim.lsp.buf.formatting_sync,
        })
      end
    end
    return config -- return final config table to use in require("null-ls").setup(config)
  end,
  -- treesitter = { -- overrides `require("treesitter").setup(...)`
  --   ensure_installed = { "lua" },
  -- },
  -- -- use mason-lspconfig to configure LSP installations
  -- ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
  --   ensure_installed = { "sumneko_lua" },
  -- },
  -- use mason-tool-installer to configure DAP/Formatters/Linter installation
  ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
    ensure_installed = { "prettier", "stylua" },
  },
  packer = { -- overrides `require("packer").setup(...)`
    compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
  },


  {
      "sainnhe/sonokai",
      init = function() -- init function runs before the plugin is loaded
        vim.g.sonokai_style = "shusia"
        vim.g.sonokai_transparent_background = 2
      end,
    },
   {
      "rmehri01/onenord.nvim",
      init = function()
        require('onenord').setup({
          disable = {
            background = true,
            borders = true,
          },
        })
      end,
    },
    {
      "bluz71/vim-nightfly-colors",
      init = function()
        vim.g.nightflyCursorColor = 1
      end,
    },
    {
      "overcache/NeoSolarized",
      init = function ()
        vim.g.neosolarized_style = "dark"
      end,
    },
    {
      "catppuccin/nvim",
      init = function ()
        require("catppuccin").setup({
          flavor = "mocha",
          transparent_background = true,
        })
      end
    },
    {
    "lukas-reineke/virt-column.nvim",
      init = function()
      require("virt-column").setup({
        char = "║",
              })
      end
     },
  {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  event = "InsertEnter",
      as = 'hop',
      config = [[require('user.hop')]],
    },
  {
"nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {"json", "html", "markdown", "typescript", "javascript", "css"},
      auto_install = true,
      },
    },

 {
     "goolord/alpha-nvim",
      opts = function(_, opts) 
  opts.section.header.val = {
    "   █████    ██   ██  ███    ███ ██    ██ ████████",
    "  ██   ██ ████ ████  ████  ████  ██  ██     ██   ",
    "  ███████   ██   ██  ██ ████ ██   ████      ██   ",
    "  ██   ██   ██   ██  ██  ██  ██    ██       ██   ",
    "  ██   ██   ██   ██  ██      ██    ██       ██   ",
    "",
    "     █████  ███████ ████████ ██████   ██████  ",
    "    ██   ██ ██         ██    ██   ██ ██    ██ ",
    "    ███████ ███████    ██    ██████  ██    ██ ",
    "    ██   ██      ██    ██    ██   ██ ██    ██ ",
    "    ██   ██ ███████    ██    ██   ██  ██████  ",
    "",
    "        ███    ██ ██    ██ ██ ███    ███",
    "        ████   ██ ██    ██ ██ ████  ████",
    "        ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "        ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "        ██   ████   ████   ██ ██      ██",
    "",
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
}

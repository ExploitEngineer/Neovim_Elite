return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=never",
          },
          on_attach = function()
            print("clang attached")
          end,
        },
        gopls = {},
        tsserver = {},
        rust_analyzer = {},
        zls = {},
        asm_lsp = {},
        html = {},
        cssls = {},
        jsonls = {},
        yamlls = {},
        dockerls = {},
        tailwindcss = {},
        lua_ls = {},
        bashls = {},
        marksman = {},
        prisma = {},
        omnisharp = {
          cmd = { "omnisharp" },
        },
      },
    },
  },

  -- Optional: disable Mason auto-installation if it’s conflicting
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false,
    },
  },
}

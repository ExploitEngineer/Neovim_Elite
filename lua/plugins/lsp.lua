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
            "--inlay-hints=false",
          },
          on_attach = function(client, bufnr)
            print("clang attached")
            -- Detect API style and disable hints
            local ih = vim.lsp.inlay_hint
            if type(ih) == "table" and type(ih.enable) == "function" then
              -- New Neovim (expects only boolean)
              ih.enable(false)
            elseif type(ih) == "function" then
              -- Old Neovim API
              ih(bufnr, false)
            end
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

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_installation = false,
    },
  },
}

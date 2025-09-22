local default_config = require("nvchad.configs.lspconfig")
local on_attach = default_config.on_attach
local capabilities = default_config.capabilities

-- custom on_attach with extra keymaps
local function custom_on_attach(client, bufnr)
  on_attach(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- code action
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- hover docs
end

local lspconfig = require("lspconfig")

lspconfig.html.setup({
  on_attach = custom_on_attach,
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  on_attach = custom_on_attach,
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  on_attach = custom_on_attach,
  capabilities = capabilities,
})

lspconfig.bashls.setup({
  on_attach = custom_on_attach,
  capabilities = capabilities,
  filetypes = { "sh", "bash" },
})

lspconfig.marksman.setup({
  on_attach = custom_on_attach,
  capabilities = capabilities,
  filetypes = { "markdown", "markdown.mdx" },
})

lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    custom_on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  settings = {
    typescript = {
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
        importModuleSpecifierPreference = "non-relative",
      },
    },
    javascript = {
      preferences = {
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
        importModuleSpecifierPreference = "non-relative",
      },
    },
  },
})

lspconfig.jsonls.setup({
  on_attach = custom_on_attach,
  capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
  on_attach = custom_on_attach,
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescriptreact",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})

lspconfig.lua_ls.setup({
  on_attach = custom_on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      runtime = { version = "LuaJIT" },
      telemetry = { enable = false },
    },
  },
})

vim.ui.select = require("telescope.themes").get_dropdown({})
require("telescope").load_extension("ui-select")

local M = {}

M.setup_lsp = function(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Code Actions
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  -- Hover Docs
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  -- Add other custom LSP keymaps here if needed
end

return M

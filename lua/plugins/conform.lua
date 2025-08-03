return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      objc = { "clang_format" },
      json = { "clang_format" },
    },
    formatters = {
      clang_format = {
        command = "clang-format",
        args = { "--assume-filename", "$FILENAME" },
      },
    },
  },
}

-- Here is a more advanced example where we pass configuration options to a plugin
-- This is equivalent to the following lua:
--  require('<plugin>').setup({ ... })
--
return { -- Autoformat
  'stevearc/conform.nvim',
  event = 'VeryLazy',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua    = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'isort', 'black' },
      shell  = { 'shfmt', 'shellcheck' },
      bash   = { 'shfmt', 'shellcheck' },
      zsh    = { 'shfmt', 'shellcheck' },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = { { 'prettierd', 'prettier' } },
      html       = { { 'prettierd', 'prettier' } },
      json       = { { 'prettierd', 'prettier' } },
      yaml       = { { 'prettierd', 'prettier' } },
      markdown   = { { 'prettierd', 'prettier' } },
    },
  },
}
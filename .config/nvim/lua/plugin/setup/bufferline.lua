return { -- tabpage integration
  'akinsho/bufferline.nvim',
  version = '*',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup()
    vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<CR>', { desc = 'Go to next [B]uffer', silent = true })
    vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Go to previous [B]uffer', silent = true })
  end
}
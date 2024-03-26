return {
  'tpope/vim-fugitive',
  config = function()
    -- Opening and closing folds
    -- zc (close), zo (open), and za (toggle) operate on one level of folding, at the cursor 
    vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>', { desc = '[G]it [D]iff split' })
  end,
}
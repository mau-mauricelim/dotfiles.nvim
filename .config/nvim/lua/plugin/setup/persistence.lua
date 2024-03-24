return {
  'folke/persistence.nvim',
  event = { 'BufReadPre', 'BufNewFile' }, -- this will only start session saving when an actual file was opened
  opts = { options = vim.opt.sessionoptions:get() },
  -- stylua: ignore
  keys = {
    { '<leader>qs', function() require('persistence').load() end,                desc = 'Restore Session' },
    { '<leader>ql', function() require('persistence').load({ last = true }) end, desc = 'Restore Last Session' },
    { '<leader>qd', function() require('persistence').stop() end,                desc = 'Do not Save Current Session' },
  },
  init = function()
    -- An actual file was opened
    if next(vim.fn.argv()) ~= nil then
      local current_buffer = vim.fn.expand('%')
      -- Restore last session
      require('persistence').load()
      -- Switch back to current buffer
      vim.cmd('buffer ' .. current_buffer)
    end
  end,
}
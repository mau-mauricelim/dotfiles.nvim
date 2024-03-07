return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
      theme = 'hyper',
      config = {
        -- header = { 'Custom header' },
        week_header = { enable = true },
        shortcut = {
          -- { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Find file',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Live grep',
            group = 'DiagnosticHint',
            action = 'Telescope live_grep',
            key = 'g',
          },
          {
            desc = ' Neovim files',
            group = 'Number',
            action = 'lua require \'telescope.builtin\'.find_files { cwd = vim.fn.stdpath \'config\' }',
            key = 'n',
          },
        },
      },
    }
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
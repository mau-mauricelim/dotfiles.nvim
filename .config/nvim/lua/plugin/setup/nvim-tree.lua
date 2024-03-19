return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  -- you can use the VeryLazy event for things that can
  -- load later and are not important for the initial UI
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    vim.keymap.set('n', '<C-o>', ':NvimTreeFindFileToggle<CR>', { silent = true })

    -- pass to setup along with your other options
    require('nvim-tree').setup({
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', '?',     api.tree.toggle_help,           opts('Help'))
      end,
    })
  end,
}
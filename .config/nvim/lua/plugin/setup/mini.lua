return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Align text interactively
    --
    -- Examples:
    --  - ga= - g[A]lign with [=]modifier
    --  - gA= - start_with_preview
    require('mini.align').setup()

    -- Automatic highlighting of word under cursor
    require('mini.cursorword').setup()

    -- "f, F, t, T, ;" to Jump to next/previous single character
    require('mini.jump').setup()
    -- "Enter" to jump within visible lines via iterative label filtering
    require('mini.jump2d').setup()

    -- Window with buffer text overview, scrollbar, and highlights
    -- Pure scrollbar config
    require('mini.map').setup({
      -- Customize `symbols` to your liking
      window = {
        -- Set this to the maximum width of your scroll symbols
        width = 1,
        -- Set this to your liking. Try values 0, 25, 50, 75, 100
        winblend = 100,
        -- Don't need extra column
        show_integration_count = false,
      }
    })
    vim.keymap.set('n', '<Leader>mt', MiniMap.toggle, { desc = '[M]iniMap [T]oggle' })
    -- autoopen functionality
    vim.cmd('autocmd vimenter * lua MiniMap.open()')

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()
  end,
}

-- To re-enable these features, put it inside of config = function() ... end
--
-- Simple and easy statusline.
--[[ Similar to nvim-lualine/lualine.nvim
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require 'mini.statusline'
statusline.setup()

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l:%-2v'
end
--]]

-- Highlight patterns in text
--[[ Similar to folke/todo-comments.nvim
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = {'%f[%w]()FIXME()%f[%W]', '%f[%w]()Fixme()%f[%W]', '%f[%w]()fixme()%f[%W]' },
          group = 'MiniHipatternsFixme' },
    hack  = { pattern = {'%f[%w]()HACK()%f[%W]',  '%f[%w]()Hack()%f[%W]',  '%f[%w]()hack()%f[%W]'  },
          group = 'MiniHipatternsHack'  },
    todo  = { pattern = {'%f[%w]()TODO()%f[%W]',  '%f[%w]()Todo()%f[%W]',  '%f[%w]()todo()%f[%W]'  },
          group = 'MiniHipatternsTodo'  },
    note  = { pattern = {'%f[%w]()NOTE()%f[%W]',  '%f[%w]()Note()%f[%W]',  '%f[%w]()note()%f[%W]'  },
          group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})
--]]

-- Show next key clues
--[[ Similar to folke/which-key.nvim
local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})
--]]
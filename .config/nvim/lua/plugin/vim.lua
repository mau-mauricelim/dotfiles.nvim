-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
-- vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true
vim.opt.undolevels = 100000
vim.opt.undoreload = 100000

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 100 -- suggested by airblade/vim-gitgutter
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 10

-- Show existing tab with 4 spaces width
vim.opt.tabstop = 4
-- When indenting with '>', use 4 spaces width
vim.opt.shiftwidth = 4
-- On pressing tab, insert 4 spaces
vim.opt.expandtab = true
-- No wrap
vim.opt.wrap = false
-- Allow the cursor to move just past the end of the line
vim.opt.virtualedit = 'onemore'

-- Syntax highlighting that are not supported
vim.cmd('syntax on')

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- List of all commands for each mode
-- :h index

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Center screen on current line
vim.keymap.set('n', 'j', 'jzz')
vim.keymap.set('n', 'k', 'kzz')
vim.keymap.set('n', 'G', 'Gzz')
vim.keymap.set('n', '<C-End>', '<C-End>zz')
vim.keymap.set('n', '<Down>', 'jzz')
vim.keymap.set('n', '<Up>', 'kzz')
vim.keymap.set('n', '<PageUp>', '<PageUp>zz')
vim.keymap.set('n', '<PageDown>', '<PageDown>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Remap C-c to Esc
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Save file
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Indenting to remain in visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Toggle line number
vim.keymap.set('n', '<C-n>', '<cmd>set nonu! nornu!<CR>', { desc = 'Toggle line [N]umber' })

-- Sentence case word
vim.keymap.set('n', '<Leader>gs', 'guiwv~', { desc = '[S]entence case word' })

-- Visual block mode - suppress the default <C-c>/<C-v> mapping specifically for WSL
vim.keymap.set('n', '<Leader>vb', '<C-v>', { desc = '[V]isual [Block] mode' })

-- Toggle virtual edit mode between onemore and all
vim.keymap.set('n', '<Leader>ve',
  function()
    if vim.o.virtualedit == 'onemore' then
      print('virtualedit=all')
      vim.opt.virtualedit = 'all'
    else
      print('virtualedit=onemore')
      vim.opt.virtualedit = 'onemore'
    end
  end,
  -- Since Lua function don't have a useful string representation, you can use the "desc" option to document your mapping
  {desc = 'Toggle [V]irtual[E]dit mode between onemore and all'}
)

-- Delete line and insert
vim.keymap.set('n', '<Leader>dd', '^d$a', { desc = 'Delete line and insert' })
-- Delete all lines and insert
vim.keymap.set('n', '<Leader>da', 'ggdGi', { desc = '[D]elete [A]ll lines and insert' })
-- Search and replace the word under the cursor
vim.keymap.set('n', '<Leader>sr', [[:%s/<C-r><C-w>//g<Left><Left>]], { desc = '[S]earch and [R]eplace the word under the cursor' })

-- Copy File Name/Path to unamed register - p to paste
vim.keymap.set('n', '<Leader>cf', '<cmd>let @" = expand("%")<CR>', { desc = '[C]opy [F]ile' })
vim.keymap.set('n', '<Leader>cp', '<cmd>let @" = expand("%:p")<CR>', { desc = '[C]opy [P]ath' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable auto comment new lines
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})
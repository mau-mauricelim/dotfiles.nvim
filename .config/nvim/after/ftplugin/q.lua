-- Disable mini.pair based on buffer file type
vim.keymap.set('i', '`', '`', { buffer = 0 })

-- Autocompletion and signature help plugin
require('mini.completion').setup()
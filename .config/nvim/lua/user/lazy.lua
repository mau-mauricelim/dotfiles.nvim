-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
    -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
    -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    -- NOTE: Plugins can also be added by using a table,
    -- with the first argument being the link and the following
    -- keys can be used to configure plugin behavior/loading/etc.
    --
    -- Use `opts = {}` to force a plugin to be loaded.
    --
    --  This is equivalent to:
    --    require('<plugin>').setup({})

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
    -- A Vim plugin which shows a git diff in the sign column
    'airblade/vim-gitgutter',

    -- Here is a more advanced example where we pass configuration options to a plugin
    -- This is equivalent to the following lua:
    --    require('<plugin>').setup({ ... })
    -- Autoformat
    require('setup.conform'),

    -- NOTE: Plugins can also be configured to run lua code when they are loaded.
    require('setup.which-key'),

    -- NOTE: Plugins can specify dependencies.
    require('setup.telescope'),

    -- LSP Configuration & Plugins
    require('setup.lsp'),

    -- Autocompletion
    require('setup.nvim-cmp'),

    -- Colorscheme
    require('setup.colorscheme'),

    -- Highlight todo, notes, etc in comments
    require('setup.todo-comments'),

    -- Collection of various small independent plugins/modules
    require('setup.mini'),

    -- Highlight, edit, and navigate code
    require('setup.nvim-treesitter'),
})
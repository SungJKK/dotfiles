-- Keybindings
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-c>', ':BufferClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-h>', ':BufferMovePrev<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-l>', ':BufferMoveNext<cr>', { noremap = true, silent = true })

-- Settings
-- TODO: In lua config?
vim.cmd('let bufferline = get(g:, \'bufferline\', {})')
vim.cmd('let bufferline.animation = v:false')
vim.cmd('let bufferline.icon_separator_active = \'▎\'')
vim.cmd('let bufferline.icon_separator_inactive = \'▎\'')
vim.cmd('let bufferline.icon_close_tab = \'\'')
vim.cmd('let bufferline.icon_close_tab_modified = \'●\'')

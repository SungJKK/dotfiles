
-- Disable audible & visual bells
vim.cmd('set noerrorbells')
vim.cmd('set novisualbell')
vim.cmd('set t_vb=')

-- General settings
vim.cmd('syntax on')
vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.

vim.o.fileencoding = "utf-8" 
vim.wo.wrap = true
vim.o.pumheight = 10
vim.o.cmdheight = 2 
vim.cmd('set colorcolumn=99999')
vim.o.mouse = "a" 
vim.o.splitbelow = true 
vim.o.termguicolors = true 
vim.o.splitright = true

TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"

vim.o.title = true

vim.g.nvcode_termcolors=256

vim.cmd('syntax on') -- syntax highlighting
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true -- set numbered lines
-- vim.wo.relativenumber = true -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 500 -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.g.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser
vim.cmd('filetype plugin on') -- filetype detection
vim.o.guifont = "JetBrainsMono Nerd Font:h12"
vim.o.hidden = true -- Required to keep multiple buffers open multiple buffers
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore

vim.o.completeopt = "menuone,noselect"  -- needed for nvim-compe

vim.cmd('autocmd FileType * set formatoptions-=cro')   -- stop newline continuation of comments



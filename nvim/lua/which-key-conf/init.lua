
require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- Keybindings: shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "center"
    },
    ignore_missing = false,
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = false -- show help message on the command line when the popup is visible
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false -- use `nowait` when creating keymaps
}

-- Keybindings
-- Set leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Better window splitting
vim.api.nvim_set_keymap('n', '<Leader>v', ':vsp<CR>',  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':sp<CR>',  { noremap = true, silent = true })

-- Run shellscript file (for curl)
vim.api.nvim_set_keymap('n', '<leader>r', ':Exec<cr>', {noremap = true, silent = true})

-- Toggle highlight
vim.api.nvim_set_keymap('n', '<Leader>l', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- Toggle NvimTree explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- SymbolsOutline
vim.api.nvim_set_keymap('n', '<leader>o', ':SymbolsOutline<cr>', {silent = true, noremap = true})

-- Toggle Dashboard
vim.api.nvim_set_keymap('n', '<Leader>;', ':Dashboard<CR>', {noremap = true, silent = true})

-- Close buffer
vim.api.nvim_set_keymap("n", "<leader>c", ":BufferClose<CR>", {noremap = true, silent = true})

-- Toggle comments
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})


local mappings = {
    ["/"] = "Comment",
    ["v"] = "Split vertical",
    ["h"] = "Split Horizontal",
    ["r"] = "Run script",
    ["c"] = "Close Buffer",
    ["e"] = "Explorer",
    ["o"] = "Symbols tree",
    ["l"] = "No Highlight",
    t = {
        name = "+Terminal",
        t = {"<cmd>lua require('FTerm').toggle()<CR>", "floatterm"},
        g = {"<cmd>lua _fterm_lazygit()<CR>", "lazygit"},
        d = {"<cmd>lua _fterm_lazydocker()<CR>", "lazydocker"},
        c = {"<cmd>lua require('FTerm').close()<CR>", "close terminals"},
    },
    x = {
        name = "+QuickFix",
        o = {":QFixToggle<CR>", "Toggle"},
        t = {":TodoQuickFix<CR>", "Todos"},
        k = {":cprev<CR>", "Prev fix"},
        j = {":cnext<CR>", "Next fix"},
    },
    d = {
        name = "+Diagnostics",
        t = {"<cmd>TroubleToggle<cr>", "trouble"},
        w = {"<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace"},
        d = {"<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document"},
        q = {"<cmd>TroubleToggle quickfix<cr>", "quickfix"},
        l = {"<cmd>TroubleToggle loclist<cr>", "loclist"},
        r = {"<cmd>TroubleToggle lsp_references<cr>", "references"},
    },
    i = {
        name = "+LSP",
        a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
        A = {"<cmd>Lspsaga range_code_action<cr>", "Selected Action"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        f = {"<cmd>LspFormatting<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        l = {"<cmd>Lspsaga lsp_finder<cr>", "LSP Finder"},
        L = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics"},
        p = {"<cmd>Lspsaga preview_definition<cr>", "Preview Definition"},
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>Lspsaga rename<cr>", "Rename"},
        t = {"<cmd>LspTypeDefinition<cr>", "Type Definition"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"},
        e = {"<cmd>Telescope lsp_references<CR>", "Lsp Reference"},
    },
    g = {
        name = "+Git",
        g = {"<cmd>lua _fterm_lazygit()<CR>", "lazygit"},
        t = {":GitBlameToggle<cr>", "Git Blame"},
        s = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        S = {"<cmd>Telescope git_stash<cr>", "Apply stash"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {"<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)"},

        u = {"<cmd>UndoStageHunk<cr>", "Undo Stage Hunk"},
        j = {"<cmd>NextHunk<cr>", "Next Hunk"},
        k = {"<cmd>PrevHunk<cr>", "Prev Hunk"},
        p = {"<cmd>PreviewHunk<cr>", "Preview Hunk"},
        r = {"<cmd>ResetHunk<cr>", "Reset Hunk"},
        R = {"<cmd>ResetBuffer<cr>", "Reset Buffer"},
        h = {"<cmd>StageHunk<cr>", "Stage Hunk"},
    },
    f = {
        name = "+Search",
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        B = {"<cmd>Telescope file_browser<cr>", "File Browser"},
        b = {"<cmd>Telescope buffers<cr>", "Buffers"},
        C = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
        D = {"<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
        m = {"<cmd>Telescope marks<cr>", "Marks"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
        T = {"<cmd>Telescope tags<cr>", "Tags"}
    },
    s = {
        name = "+Session",
        s = {"<cmd>SessionSave<cr>", "Save Session"},
        l = {"<cmd>SessionLoad<cr>", "Load Session"},
    },
    z = {
        name = "+Zen",
        s = {"<cmd>TZBottom<cr>", "toggle status line"},
        t = {"<cmd>TZTop<cr>", "toggle tab bar"},
        z = {"<cmd>TZAtaraxis<cr>", "toggle zen"},
    },
}


local wk = require("which-key")
wk.register(mappings, opts)

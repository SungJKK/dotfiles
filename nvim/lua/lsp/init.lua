-- Set Default Prefix.
vim.fn.sign_define("LspDiagnosticsSignError",
                   { text = '' , texthl = "LspDiagnosticsSignError" })
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   { text = '' , texthl = "LspDiagnosticsSignWarning" })
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   { text = '' , texthl = "LspDiagnosticsSignInformation" })
vim.fn.sign_define("LspDiagnosticsSignHint",
                   { text = '' , texthl = "LspDiagnosticsSignHint" })


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "",
      spacing = 5,
    },
    signs = true,
    underline = true,
  }
)

-- Symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    "   (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}


-- LspConfig
-- Keybindings
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap=true, silent=true })

vim.api.nvim_set_keymap("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap=true, silent=true })
vim.api.nvim_set_keymap("n", "gF", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", { noremap=true, silent=true })

vim.api.nvim_set_keymap('n', 'ca', ':Lspsaga code_action<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', 'rn', ':Lspsaga rename<CR>', { noremap=true, silent=true })

vim.api.nvim_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', 'gh', ':Lspsaga lsp_finder<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', { noremap=true, silent=true })

vim.api.nvim_set_keymap('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>', { noremap=true, silent=true })
-- scroll down/up hover doc or scroll in definition preview
vim.api.nvim_set_keymap('n', '<C-p>', "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<C-n>', "<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { noremap=true, silent=true })
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')


-- Use an on_attach function to only map the following keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
        hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
    if client.server_capabilities.colorProvider then
        require"lsp-documentcolors".buf_attach(bufnr, { single_column = true })
    end
end

-- LspInstall
-- Automate hls installation
local hls_config = require"lspinstall/util".extract_config("hls")
hls_config.default_config.cmd[1] = "~/.ghcup/bin/haskell-language-server-wrapper"
require'lspinstall/servers'.hls = vim.tbl_extend('error', hls_config, {
  -- lspinstall will automatically create/delete the install directory for every server
  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  ~/.ghcup/bin/ghcup install hls
  ]],
  uninstall_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  ~/.ghcup/bin/ghcup rm hls 1.2.0
  ]]
})

-- Automate server setup
local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.colorProvider = { dynamicRegistration = false }

    for _, server in pairs(servers) do
        require'lspconfig'[server].setup{
            capabilities = capabilities,
            on_attach = on_attach
        }
    end
end

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


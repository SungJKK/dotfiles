require'lspconfig'.bashls.setup {
    cmd = {DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
    filetypes = { "sh", "bash", "zsh" }
}

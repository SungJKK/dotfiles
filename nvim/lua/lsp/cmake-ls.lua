require'lspconfig'.cmake.setup {
    cmd = {DATA_PATH .. '/lspinstall/cmake/venv/bin/cmake-language-server'},
    filetypes = { "cmake", "make" }
}

require'lspconfig'.texlab.setup{
    cmd = {DATA_PATH .. "/lspinstall/latex/texlab"},
	root_dir = vim.loop.cwd
}

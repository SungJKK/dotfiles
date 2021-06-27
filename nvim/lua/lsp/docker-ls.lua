require'lspconfig'.dockerls.setup {
    cmd = {DATA_PATH .. "/lspinstall/dockerfile/node_modules/.bin/docker-langserver", "--stdio"},
	root_dir = vim.loop.cwd
}

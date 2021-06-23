require'lspconfig'.yamlls.setup{
	cmd = {DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
	root_dir = vim.loop.cwd,
    filetypes = { "yaml" }
}

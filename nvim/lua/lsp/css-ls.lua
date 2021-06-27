require'lspconfig'.cssls.setup {
    cmd = {
        "node", DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
        "--stdio"
    },
	root_dir = vim.loop.cwd
}

--[[
    root_dir = function(fname)
        return require('lspconfig/util').root_pattern(fname) or vim.loop.os_homedir()
    end;
--]]

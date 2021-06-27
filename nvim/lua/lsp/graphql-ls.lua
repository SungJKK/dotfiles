require'lspconfig'.graphql.setup {
    filetypes = { "graphql" },
    root_dir = require('lspconfig/util').root_pattern('.git', '.graphqlrc')
}

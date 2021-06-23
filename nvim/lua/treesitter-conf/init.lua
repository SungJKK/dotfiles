require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {''}, 
    matchup = {
        enable = true
    },
    highlight = {
        enable = true
    },
    context_commentstring = {
        enable = true,
        javascript = {
            __default = '// %s',
            jsx_element = '{/* %s */}',
            jsx_fragment = '{/* %s */}',
            jsx_attribute = '// %s',
            comment = '// %s'
        }
    },
    autotag = {
        enable = true
    },
}

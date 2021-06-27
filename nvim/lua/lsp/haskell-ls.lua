
require'lspconfig'.hls.setup{
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    filetypes = { "haskell", "lhaskell" },
    lspinfo = function (cfg)
        -- return "specific"
        if cfg.settings.languageServerHaskell.logFile or false then
            return "logfile: "..cfg.settings.languageServerHaskell.logFile
        end
        return ""
    end;
    root_dir = require('lspconfig/util').root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml"),
}

--[[
    settings = {
        languageServerHaskell = {
            formattingProvider = "ormolu"
        }
    }
--]]

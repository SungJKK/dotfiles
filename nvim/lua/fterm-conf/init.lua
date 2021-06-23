require('FTerm').setup({
    dimensions  = {
        height = 0.9,
        width = 0.9,
        x = 0.5,
        y = 0.5
    },
    border = 'single' -- or 'double'
})


local term = require("FTerm.terminal")

-- Lazygit
local lazygit = term:new():setup({
    cmd = "lazygit",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})
function _fterm_lazygit()
    lazygit:toggle()
end

-- Lazydocker
local lazydocker = term:new():setup({
    cmd = "lazydocker",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})
function _fterm_lazydocker()
    lazydocker:toggle()
end

-- TODO: Setup lazykube


local lualine = require('lualine')
-- local config = lualine.get_config()

-- lualine line setup:
-- +---+---+-------------------------------+---+---+
-- | A | B | C                           X | Y | Z |
-- +---+---+-------------------------------+---+---+

lualine.setup({
    options = {
        component_separators = { left = '', right = '|' },
        section_separators = { left = '', right = '' },
        refresh = {

        }
    }
})


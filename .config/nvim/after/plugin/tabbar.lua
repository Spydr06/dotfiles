vim.g.barbar_auto_setup = false
require('barbar').setup {
    animation = false,
    auto_hide = true,
    clickable = true,
    tabpages = false,
    icons = {
        button = '',
        filetype = {
            custom_colors = false,
            enabled = true
        }
    }
}


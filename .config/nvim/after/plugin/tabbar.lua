vim.g.barbar_auto_setup = false
require('barbar').setup {
    animation = false,
    auto_hide = true,
    clickable = false,
    tabpages = false,
    icons = {
        button = '',
        filetype = {
            custom_colors = false,
            enabled = true
        }
    }
}


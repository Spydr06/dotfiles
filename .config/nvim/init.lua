require("config.autocmd")
require("config.lazy")

require("config.set")
require("config.remap")

vim.cmd([[
    autocmd BufRead,BufNewFile *.csp set filetype=cspydr
    autocmd Syntax cspydr runtime! vim/syntax/cspydr.vim
]])


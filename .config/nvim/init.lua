require("config.autocmd")
require("config.lazy")

require("config.set")
require("config.remap")

vim.cmd([[
    autocmd BufRead,BufNewFile *.csp set filetype=cspydr
    autocmd Syntax cspydr runtime! syntax/cspydr.vim
]])

vim.cmd([[
    autocmd BufRead,BufNewFile *.shard set filetype=shard
    autocmd Syntax shard runtime! syntax/shard.vim
]])


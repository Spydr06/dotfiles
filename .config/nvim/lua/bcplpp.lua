-- BCPLPP neovim plugin

local function setup()
    vim.cmd([[
        autocmd Bufread,BufNewFile *.bpp set filetype=bcplpp
        autocmd Syntax bcplpp runtime! syntax/bcplpp.vim
    ]])
end

return {
    setup = setup
}


require("autoclose").setup({
    -- disable autoclosing when the cursor touches an alphanumeric character
    -- e.g. (word
    --      ^      <- don't autoclose here
    options = {
        disable_when_touch = true
    },
})


require("ibl").setup {
    indent = {
        char = "▏",
    },
    exclude = {
        buftypes = {
            "terminal",
            "nofile",
            "help",
            "quickfix",
            "prompt"
        },
        filetypes = {
            "lspinfo",
            "packer",
            "dashboard",
            "help",
            "man",
            "gitcommit",
            "TelescopePrompt",
            "TelescopeResults",
            ""
        }
    },
}


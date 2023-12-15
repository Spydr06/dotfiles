require("ibl").setup {
    indent = {
        char = "▏",
    },
    scope = {
        show_start = false,
        show_end = false,
        show_exact_scope = false
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


local db_header =  {
    "",
    "",
    "",
    "",
    "     ▄████▄                                                     ",
    "    ███  ██▄                                                    ",
    "    ▀▀    ██▄                                 _|                ",
    "           ██           _|_|_|    _|      _|      _|_|_|  _|_|  ",
    "         ████           _|    _|  _|      _|  _|  _|    _|    _|",
    "       ██████▄          _|    _|    _|  _|    _|  _|    _|    _|",
    "      ██▀  ███          _|    _|      _|      _|  _|    _|    _|",
    "    ▄██▀    ██▄▄██                                              ",
    "    ██▀      ▀██▀                                               ",
    "",
    "",
    "",
    ""
}

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        lazy = true,
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show { global = false}
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				styles = {
					comments = { italic = true },
					keyworkds = { italic = true },
					sidebars = "transparent",
					floats = "transparent",
				},
				transparent = true,
				lualine_bold = true,
			})

			vim.cmd([[colorscheme tokyonight]])
			
			vim.cmd.highlight({ "CursorLine", "cterm=NONE", "ctermbg=NONE", "ctermfg=NONE", "guibg=NONE", "guifg=NONE" })
		end,
	},
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag"
        },
        main = "nvim-treesitter.configs",
        opts = {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            auto_install = true,
            
            sync_install = false,

            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "gitignore",
                "gleam",
                "go",
                "haskell",
                "html",
                "java",
                "javascript",
                "json",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "ocaml",
                "rust",
                "typescript",
                "vim",
                "xml",
                "yaml",
                "zig",
            },
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf, remap = false }
                    --[[
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(true)
                    end
                    ]]

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                end
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { 
            "hrsh7th/cmp-nvim-lsp",
            "neovim/nvim-lspconfig",
        },
        config = function()
            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select },

            cmp.setup {
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer', keyword_length = 3 },
                },
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                window = {
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true })
                })
            }
        end,
    },
    {
        "williamboman/mason.nvim",
        version = "^1.0.0",
        dependencies = {
            { "williamboman/mason-lspconfig.nvim", version = "^1.0.0" },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup {
                ui = {
                    border = "rounded"
                }
            }

            require("mason-lspconfig").setup()

            require("mason-lspconfig").setup_handlers {
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end
            }
        end
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            require('tiny-inline-diagnostic').setup {
                preset = "classic",
            }
            vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
        end
    },
    --[[{
        "simrat39/rust-tools.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local rt = require('rust-tools')

            rt.setup({
                server = {
                    on_attach = function (_, bufnr)
                        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    end
                }
            })

            rt.inlay_hints.set()
            rt.inlay_hints.enable()
        end,
    },]]
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)

            require('telescope').setup {
                defaults = {
                    layout_strategy = 'horizontal',
                    layout_config = { height = 0.75 }
                }
            }
        end
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>U", vim.cmd.UndotreeToggle },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            signs = {
                add         = { text = '▌' },
                change      = { text = '▌' },
                untracked   = { text = '┆' },
            }
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
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
        },
    },
    {
        "m4xshen/autoclose.nvim",
        opts = {
            options = { disable_when_touch = true },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
                refresh = {

                },
            },
            sections = {
                lualine_x = {
                    {'o:encoding', fmt = string.lower},
                    {'o:fileformat'},
                    'filetype'
                },
            },
        },
    },
    {
        "romgrk/barbar.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
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
        },
    },
    {
        "glepnir/dashboard-nvim",
        opts = {
            theme = 'doom',
            shortcut_type = 'number',
            config = {
                header = db_header,
                center = {
                    {
                        icon = "󰈞  ",
                        desc = "Find  File                              ",
                        action = "Telescope find_files",
                        key = "SPC f f",
                    },
                    {
                        icon = "  ",
                        desc = "Open Configuration                     ",
                        action = "tabnew $MYVIMRC | tcd %:p:h",
                        key = "SPC e v",
                    },
                    {
                        icon = "  ",
                        desc = "New file                                ",
                        action = "enew",
                        key = "e",
                    },
                    {
                        icon = "×  ",
                        desc = "Quit Nvim                               ",
                        action = "qa",
                        key = "q",
                    },
                }
            }
        }
    },
}


-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		--or				, branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- tokyo night color scheme
	use('folke/tokyonight.nvim')

	-- treesitter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- lsp
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

    -- rust tools
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

	-- undo tree
	use('mbbill/undotree')

	-- fugitive (git)
	use('tpope/vim-fugitive')

    -- close parens
    use('m4xshen/autoclose.nvim')

    -- icon support
    use('nvim-tree/nvim-web-devicons')

    -- dashboard
    use('glepnir/dashboard-nvim')

    -- tabs
    use {
        'romgrk/barbar.nvim',
        requires = 'nvim-web-devicons'
    }

    -- status page
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- discord presence
    use 'andweeb/presence.nvim'

    -- git integration
    use 'lewis6991/gitsigns.nvim'
end)


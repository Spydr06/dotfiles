-- configure the color scheme
require("tokyonight").setup({
	style = 'night',
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		sidebars = "transparent",
		floats = "transparent",
	},
	transparent = true,
	lualine_bold = true
})

-- set the color scheme
vim.cmd.colorscheme("tokyonight")

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

return {
	{
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		dependencies = {
			"folke/lsp-colors.nvim",
		},
		config = function()
			require("tokyonight").setup({
				transparent = true,
				terminal_colors = true,
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark",
					floats = "dark",
				},
			})

			require("lsp-colors").setup({
				Error = "#db4b4b",
				Warning = "#e0af68",
				Information = "#0db9d7",
				Hint = "#10B981",
			})
		end,
	},
	{
		"rose-pine/neovim",
		config = function()
			require("rose-pine").setup({
				extend_background_behind_borders = true,

				styles = {
					transparency = true,
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"olivercederborg/poimandres.nvim",
		config = function()
			require("poimandres").setup()
		end,
	},
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				falvour = "mocha",
				transparent_background = true,
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
					styles = {
						keywords = "bold",
					},
				},
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				undercurl = true,
				transparent = false,
				commentStyle = {
					italic = false,
				},
			})
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		config = function()
			require("vscode").setup({
				transparent = true,
				italic_comments = false,
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
}

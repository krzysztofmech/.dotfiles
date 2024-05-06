return {
<<<<<<< Updated upstream
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
=======
    {
        "rose-pine/neovim",
        config = function()
            require("rose-pine").setup({
                variant = "auto", -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,
                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true,        -- Handle deprecated options automatically
                },
                styles = {
                    transparency = true,
                    comments = { italic = false },
                    keywords = { italic = false },
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark",   -- style for floating windows
                },
            })
            vim.cmd("colorscheme rose-pine")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                undercurl = true,
                transparent = true,
                commentStyle = {
                    italic = false,
                },
            })
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
    }, {
    'projekt0n/github-nvim-theme',
    config = function()
        require("github-theme").setup({
            options = {
                transparent = true, -- Disable setting background
            }
        })
    end
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
        "Mofiqul/vscode.nvim",
        config = function()
            require("vscode").setup({
                transparent = true,
                italic_comments = false,
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
>>>>>>> Stashed changes

            require("lsp-colors").setup({
                Error = "#db4b4b",
                Warning = "#e0af68",
                Information = "#0db9d7",
                Hint = "#10B981",
            })
        end,
    },
    {
        "olivercederborg/poimandres.nvim",
        config = function()
            require("poimandres").setup()
        end,
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    {

    }
}

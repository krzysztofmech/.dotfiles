return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"vimdoc",
					"javascript",
					"typescript",
					"lua",
					"jsdoc",
					"vue",
					"graphql",
					"go",
					"gomod",
					"gowork",
					"gosum",
					"json",
					"css",
					"scss",
					"markdown",
				},
				auto_install = true,
				indent = {
					enable = false,
				},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
					disable = function(_, buf)
						local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
						-- if filetype == "go" or filetype == "astro" then
						-- 	return true
						-- end
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
			})
			local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			treesitter_parser_config.templ = {
				install_info = {
					url = "https://github.com/vrischmann/tree-sitter-templ.git",
					files = { "src/parser.c", "src/scanner.c" },
					branch = "master",
				},
			}

			vim.treesitter.language.register("templ", "templ")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
			max_lines = 0,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = "outer",
			mode = "cursor",
		},
		config = function(_, opts)
			require("treesitter-context").setup(opts)
		end,
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	config = function()
		require("lualine").setup({
			options = {
				theme = 'auto',
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_b = {
					"branch",
					"diff",
					"diagnostics",
					{
						"filename",
						path = 1,
					},
				},
				lualine_c = {},
				lualine_x = {
					"encoding",
					{
						"fileformat",
						symbols = {
							unix = "", -- e712
							dos = "", -- e70f
							mac = "", -- e711
						},
					},
					"filetype",
				},
			},
		})
	end,
}

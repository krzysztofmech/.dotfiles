return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.keymap.set("n", "<leader>b", ":Neotree<CR>")
		vim.keymap.set("n", "<leader>gs", ":Neotree float git_status<CR>")
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = false,
					show_hidden_count = true,
					hide_dotfiles = true,
					hide_gitignored = false,
					hide_by_name = {
						".git",
					},
					never_show = {},
				},
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
			},
		})
	end,
}

return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("spectre").setup()
		vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
			desc = "Toggle [S]pectre",
		})
		vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
			desc = "[S]earch current [w]ord",
		})
		vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
			desc = "[S]earch current [w]ord",
		})
		vim.keymap.set("n", "<leader>sc", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
			desc = "[S]earch on [c]urrent file",
		})
	end,
}

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>", {})
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({ additional_args = { "--fixed-strings" } })
		end, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
}

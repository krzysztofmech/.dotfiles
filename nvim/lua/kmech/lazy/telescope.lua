return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ find_command = { "rg", "--files", "--hidden", "-g", "!.git" } })
		end, { desc = "Telescope [f]ind [f]iles" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope [f]ind [d]iagnostics" })
		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({ additional_args = { "--fixed-strings" } })
		end, { desc = "Telescope [f]ind [g]rep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope [f]ind [b]uffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope [f]ind [h]elp" })
	end,
}

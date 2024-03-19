return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({

				current_line_blame = true,
				current_line_blame_opts = {
					delay = 1000,
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end
					map("n", "<leader>gp", gs.preview_hunk, { desc = "[G]it inline changes [p]review" })
					map("n", "<leader>gs", gs.stage_hunk, { desc = "[G]it [s]tage changes hunk" })
					map("n", "<leader>gr", gs.reset_hunk, { desc = "[G]it [r]eset staged changes" })
					map("v", "<leader>gs", function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "[G]it [s]tage changes hunk visual" })
					map("v", "<leader>gr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end, { desc = "[G]it [r]eset changes hunk visual" })
					map("n", "<leader>gS", gs.stage_buffer, { desc = "[G]it [s]tage changes buffer" })
					map("n", "<leader>gR", gs.reset_buffer, { desc = "[G]it [r]eset staged changes buffer" })
					map("n", "<leader>gd", gs.diffthis, { desc = "[G]it [d]iff" })
				end,
			})
		end,
	},
	{
		"tpope/vim-fugitive",
	},
}

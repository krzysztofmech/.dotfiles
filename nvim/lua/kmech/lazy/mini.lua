return {
	"echasnovski/mini.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	version = "*",
	checkout = "stable",
	config = function()
		require("mini.comment").setup({
			options = {
				-- Function to compute custom 'commentstring' (optional)
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,

				-- Whether to ignore blank lines when commenting
				ignore_blank_line = false,

				-- Whether to recognize as comment only lines without indent
				start_of_line = false,

				-- Whether to force single space inner padding for comment parts
				pad_comment_parts = true,
			},
		})
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.indentscope").setup({
			symbol = "│",
			options = { try_as_border = true },
		})
	end,
}

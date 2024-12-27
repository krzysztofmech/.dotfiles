return {
	{
		"github/copilot.vim",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependecies = {
			"github/copilot.vim",
		},
		branch = "main",
		cmd = "CopilotChat",
		opts = function()
			local user = vim.env.USER or "User"

			user = user:sub(1, 1):upper() .. user:sub(2)
			return {
				auto_insert_mode = false,
				question_header = "😭  " .. user .. " ",
				answer_header = "🤓  Copilot ",
				window = {
					title = "Copilot Chat",
					width = 0.3,
				},
				highlight_selection = false,
				mappings = {
					reset = {
						normal = "<C-r>",
						insert = "<C-r>",
					},
					close = {

					}
				},
			}
		end,
		keys = {
			{ "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
			{ "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
			{
				"<leader>aa",
				function()
					local notify = require("notify")

					local toggle = function()
						local status, err = pcall(require("CopilotChat").toggle)
						if not status then
							notify("Error toggling CopilotChat: " .. err, "error", { title = "CopilotChat" })
						end
					end

					return toggle()
				end,
				desc = "Toggle (CopilotChat)",
				mode = { "n", "v" },
			},
			{

				"<leader>ax",
				function()
					return require("CopilotChat").reset()
				end,
				desc = "Clear (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>aq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input)
					end
				end,
				desc = "Quick Chat (CopilotChat)",
				mode = { "n", "v" },
			},
			-- Show prompts actions with telescope
			{
				"<leader>af",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "CopilotChat - Prompt actions",
				mode = { "n", "v" },
			},
		},

		config = function(_, opts)
			local chat = require("CopilotChat")

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-chat",
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
				end,
			})

			chat.setup(opts)
		end,
	},
}

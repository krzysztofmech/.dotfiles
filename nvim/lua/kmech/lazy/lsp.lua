local function on_resolve() end
local function on_reject()
	local text = vim.fn.expand("<cword>")

	local notify = require("notify")
	notify("No definition found: " .. text, "error", { title = "LSP" })
end

local goto_source_definition = function()
	local vtsls = require("vtsls")
	local winnr = vim.api.nvim_get_current_win()

	vtsls.commands.goto_source_definition(winnr, on_resolve, on_reject)
end

return {

	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
	},
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			luasnip.filetype_extend("javascriptreact", { "html" })
			luasnip.filetype_extend("typescriptreact", { "html" })
			luasnip.filetype_extend("javascript", { "vue" })
			luasnip.filetype_extend("typescript", { "vue" })

			-- i dont know if its necessary??
			require("luasnip.loaders.from_vscode").load()

			require("luasnip.loaders.from_vscode").lazy_load({
				paths = vim.fn.expand("~/.config/nvim/lua/kmech/snippets"),
			})

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
						before = function(_, vim_item)
							return vim_item
						end,
					}),
				},
			})
		end,
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "yioneko/nvim-vtsls" },
		},
		init = function()
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = "yes"
		end,
		config = function()
			local lsp_defaults = require("lspconfig").util.default_config

			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			lsp_defaults.capabilities =
				vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
					vim.keymap.set("n", "<leader>q", "<cmd>VtsExec source_actions<cr>", opts)
					vim.keymap.set("n", "<leader>lq", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
					vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
					vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
					vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
					vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
				end,
			})

			require("mason-lspconfig").setup({
				ensure_installed = {},
				handlers = {
					-- Default handler for all servers
					function(server_name)
						local lspconfig = require("lspconfig")
						lspconfig[server_name].setup({})
					end,
					ts_ls = function()
						local lspconfig = require("lspconfig")
						local mason_registry = require("mason-registry")

						if mason_registry.is_installed("vtsls") then
							local vue_language_server_path = mason_registry
								.get_package("vue-language-server")
								:get_install_path() .. "/node_modules/@vue/language-server"

							lspconfig.vtsls.setup({
								on_attach = function(client, bufnr)
									local opts = { buffer = bufnr }
									vim.keymap.set("n", "gd", goto_source_definition, opts)
								end,
								settings = {
									vtsls = {
										tsserver = {
											globalPlugins = {
												{
													name = "@vue/typescript-plugin",
													location = vue_language_server_path,
													languages = { "typescript", "javascript", "vue" },
													enableForWorkspaceTypeScriptVersions = true,
													configNamespace = "typescript",
												},
											},
										},
									},
									typescript = {
										updateImportsOnFileMove = { enabled = "always" },
										suggest = {
											completeFunctionCalls = true,
										},
										inlayHints = {
											parameterNames = { enabled = "literals" },
											parameterTypes = { enabled = true },
											variableTypes = { enabled = true },
											propertyDeclarationTypes = { enabled = true },
											functionLikeReturnTypes = { enabled = true },
											enumMemberValues = { enabled = true },
										},
									},
								},
								filetypes = {
									"javascript",
									"javascriptreact",
									"javascript.jsx",
									"typescript",
									"typescriptreact",
									"typescript.tsx",
									"vue",
								},
							})
						else
							lspconfig.tsserver.setup({
								on_attach = function(client, bufnr)
									local opts = { buffer = bufnr }
									vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
								end,
								filetypes = {
									"javascript",
									"javascriptreact",
									"javascript.jsx",
									"typescript",
									"typescriptreact",
									"typescript.tsx",
								},
							})
						end
					end,
					volar = function()
						require("lspconfig").volar.setup({
							init_options = {
								vue = {
									hybridMode = true,
								},
							},
						})
					end,
				},
			})
		end,
	},
}

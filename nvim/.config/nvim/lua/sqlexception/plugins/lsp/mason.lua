return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			-- import mason
			local mason = require("mason")

			local lspconfig = require("lspconfig")
			-- import mason-lspconfig
			local mason_lspconfig = require("mason-lspconfig")

			local mason_tool_installer = require("mason-tool-installer")

			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()
			-- enable mason and configure icons
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				automatic_installation = {},
				-- list of servers for mason to install
				ensure_installed = {
					"html",
					"cssls",
					"tailwindcss",
					"svelte",
					"lua_ls",
					"graphql",
					"emmet_ls",
					"prismals",
					"pyright",
					"gopls",
					"templ",
					"yamlls",
					"jdtls",
				},
				handlers = {
					-- default handler for installed servers
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end,
					svelte = function()
						-- configure svelte server
						lspconfig["svelte"].setup({
							capabilities = capabilities,
							on_attach = function(client, bufnr)
								vim.api.nvim_create_autocmd("BufWritePost", {
									pattern = { "*.js", "*.ts" },
									callback = function(ctx)
										-- Here use ctx.match instead of ctx.file
										client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
									end,
								})
							end,
						})
					end,
					emmet_ls = function()
						-- configure emmet language server
						lspconfig["emmet_ls"].setup({
							capabilities = capabilities,
							filetypes = {
								"html",
								"typescriptreact",
								"javascriptreact",
								"css",
								"sass",
								"scss",
								"less",
								"svelte",
							},
						})
					end,
					lua_ls = function()
						-- configure lua server (with special settings)
						lspconfig["lua_ls"].setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									-- make the language server recognize "vim" global
									diagnostics = {
										globals = { "vim" },
									},
									completion = {
										callSnippet = "Replace",
									},
								},
							},
						})
					end,
					gopls = function()
						lspconfig["gopls"].setup({
							settings = {
								gopls = {
									analyses = {
										unusedparams = true,
									},
									staticcheck = true,
									gofumpt = true,
								},
							},
						})
					end,
					templ = function()
						lspconfig["templ"].setup({
							capabilities = capabilities,
							filetypes = { "templ" },
						})
					end,
					tailwindcss = function()
						lspconfig["tailwindcss"].setup({
							capabilities = capabilities,
							filetypes = {
								"templ",
								"astro",
								"javascript",
								"typescript",
								"react",
								"typescriptreact",
								"javascriptreact",
							},
							settings = {
								tailwindCSS = {
									includeLanguages = {
										templ = "html",
									},
								},
							},
						})
					end,
					html = function()
						lspconfig["html"].setup({
							capabilities = capabilities,
							filetypes = { "html", "templ" },
						})
					end,
					yamlls = function()
						lspconfig["yamlls"].setup({
							capabilities = capabilities,
							filetypes = { "yaml", "yml" },
						})
					end,
					jdtls = function()
						lspconfig["jdtls"].setup({
							capabilities = capabilities,
							filetypes = { "java" },
						})
					end,
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint",
					"eslint_d",
					"golangci-lint",
					"templ",
					"goimports",
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
	},
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
		vim.keymap.set('n', '<space>l', vim.diagnostic.setloclist)

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem = {
			documentationFormat = { 'markdown', 'plaintext' },
			snippetSupport = true,
			preselectSupport = true,
			insertReplaceSupport = true,
			labelDetailsSupport = true,
			deprecatedSupport = true,
			commitCharactersSupport = true,
			tagSupport = { valueSet = { 1 } },
			resolveSupport = {
				properties = {
					'documentation',
					'detail',
					'additionalTextEdits',
				},
			},
		}

		local on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = true
			client.server_capabilities.documentRangeFormattingProvider = true
			vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
			local opts = { buffer = bufnr }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set('n', '<space>wl', function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', '<space>f', function()
				vim.lsp.buf.format { async = true }
				end,opts)
		end

		require("neodev").setup()
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					telemetry = { enable = false },
					workspace = { checkThirdParty = false },
				},
			},
		})
		require('lspconfig').csharp_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { 'csharp-ls' },
			filetypes = { 'cs' },
			init_options = { AutomaticWorkspaceInit = true },
			single_file_support = true,
		})
		require('lspconfig').html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				configurationSection = { 'html', 'css', 'javascript' },
				embeddedLanguages = {
					css = true,
					javascript = true,
				},
				provideFormatter = true,
			},
			single_file_support = true,
		})
		require('lspconfig').pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { 'pyright-langserver', '--stdio' },
			filetypes = { 'python' },
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = 'workspace',
						useLibraryCodeForTypes = true,
					},
				},
			},
			single_file_support = true,
		})

	end,
}

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- LUA
					"lua_ls",
					-- Golang
					"gopls",
					-- Python
					"pylsp",
					-- LaTeX
					"texlab",
					-- HTML
					"html",
					-- Typescript and JS
					"ts_ls"
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Keymaps
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
			vim.keymap.set('n', 'gu', vim.lsp.buf.references, {})
		end
	},
}

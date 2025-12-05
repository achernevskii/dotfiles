return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.flake8,
				-- Spelling, grammar and style checking on LaTeX documents.
				null_ls.builtins.diagnostics.textidote,
				-- prettier is required
				-- (brew install prettier)
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"html",
						"json",
						"yaml",
						"markdown",
						"vue",
						"javascript",
						"css",
						"typescript",
					},
				}),
				null_ls.builtins.formatting.terraform_fmt,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

		-- Create a group for auto formattin only go filetypes
		local augroup = vim.api.nvim_create_augroup("GoFormatting", {})

		-- Auto format Go files on save 
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			pattern = "*.go",
			callback = function()
				vim.lsp.buf.format({ async = false })
			end
		})
	end,
}

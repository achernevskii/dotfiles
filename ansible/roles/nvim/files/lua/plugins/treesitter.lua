return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = 'main',
	build = ":TSUpdate",
	config = function()
		require 'nvim-treesitter'.setup {}

		-- Ensure installed
		local ensureInstalled = {'go', 'lua'}
		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local parsersToInstall = vim.iter(ensureInstalled)
		    :filter(function(parser) return not vim.tbl_contains(alreadyInstalled, parser) end)
		    :totable()
		require("nvim-treesitter").install(parsersToInstall)

		vim.api.nvim_create_autocmd('FileType', {
			pattern = { 'go', 'lua' },
			callback = function() vim.treesitter.start() end,
		})

	end
	-- config = function()
	-- 	require("nvim-treesitter.configs").setup({
	-- 		auto_install = true,
	-- 		highlight = {
	-- 			enable = true,

	-- 			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	-- 			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	-- 			-- Using this option may slow down your editor, and you may see some duplicate highlights.
	-- 			-- Instead of true it can also be a list of languages
	-- 			additional_vim_regex_highlighting = false,
	-- 		},
	-- 		indent = {
	-- 			enable = true,
	-- 		},
	-- 	})
	-- end,
}

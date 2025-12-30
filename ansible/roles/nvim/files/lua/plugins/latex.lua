return {
	"lervag/vimtex",
	lazy = false, -- no need to lazy load since vimtex is a filetype plugin
	init = function()
		vim.keymap.set('n', '<leader>ll', '<cmd>VimtexCompile<CR>', { desc = "Compile LaTeX file" })
		vim.keymap.set('n', '<leader>ls', '<cmd>VimtexTocOpen<CR>', { desc = "Open LaTeX file structure" })
	end,
}

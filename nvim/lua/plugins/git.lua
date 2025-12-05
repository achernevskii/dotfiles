return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", {})
			vim.keymap.set("n", "<leader>gl", ":Git log<CR>", {})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			})

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame<CR>", {})
			vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR>", {})
			vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>", {})
		end,
	},
}

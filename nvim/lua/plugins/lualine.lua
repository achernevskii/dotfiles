return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lialine").setup({
			options = {
				icons_enabled = true,
				theme = "dracula",
			},
		})
	end,
}

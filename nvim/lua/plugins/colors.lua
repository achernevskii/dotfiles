return {
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Function to check if lualine has a specified theme
			local function lualine_has_theme(theme)
				local ok, _ = pcall(require, "lualine.themes." .. theme)
				return ok
			end

			-- Function to update lualine theme
			local function update_lualine_theme(theme)
				-- Set default value if lualine theme doesn't exist
				if not lualine_has_theme(theme) then
					theme = "base16"
				end

				-- Fetch the existing lualine configuration
				local lualine_config = require("lualine").get_config()

				-- Update only the theme option
				lualine_config.options.theme = theme

				-- Re-initialize lualine with the updated configuration
				require("lualine").setup(lualine_config)
			end

			-- Function to set the provided theme
			local function set_theme(theme)
				-- Clear all existing highlights
				-- to ensure clean theme switch
				vim.cmd("highlight clear")
				vim.cmd("syntax reset")
				vim.cmd("colorscheme " .. theme)

				-- Update the lualine theme
				update_lualine_theme(theme)
			end

			-- Colorscheme picker function
			local function select_colorscheme()
				-- Get the list of available colorschemes
				local colorschemes = vim.fn.getcompletion("", "color")

				-- Present a list of colorschemes
				vim.ui.select(colorschemes, { prompt = "Select Colorscheme:" }, function(choice)
					if choice then
						set_theme(choice)
					end
				end)
			end

			-- Keybinding to open the colorscheme picker
			vim.keymap.set("n", "<leader>cs", select_colorscheme, { noremap = true, silent = true })

			-- Set default theme on startup
			set_theme("default")
		end,
	},
}

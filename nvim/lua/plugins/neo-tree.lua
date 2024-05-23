return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-e>", ":Neotree filesystem toggle right<CR>")

		require("neo-tree").setup({
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.

			default_component_configs = {
				icon = {
					folder_closed = ">",  -- Symbol for closed folder
					folder_open = "▼",    -- Symbol for open folder (arrowhead down)
					folder_empty = "<",   -- Symbol for empty folder
					default = "-",        -- Symbol for default items (files)
					highlight = "NeoTreeFileIcon"
       				},
				git_status = {
					symbols = {
				                added     = "+",  -- Non-Nerd Font symbol for added files
				                modified  = "~",  -- Non-Nerd Font symbol for modified files
				                deleted   = "-",  -- Non-Nerd Font symbol for deleted files
				                renamed   = ">",  -- Non-Nerd Font symbol for renamed files
				                untracked = "x",  -- Non-Nerd Font symbol for untracked files
				                ignored   = "i",  -- Non-Nerd Font symbol for ignored files
				                unstaged  = "*",  -- Non-Nerd Font symbol for unstaged changes
				                staged    = "✔",  -- Non-Nerd Font symbol for staged changes
				                conflict  = "✖",  -- Non-Nerd Font symbol for conflicts
       				     }
        			},
			},
		})
	end,
}




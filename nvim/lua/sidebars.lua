-- close_sidebars will close all the vim sidebars if the window size is too small
local function close_sidebars()
	local columns = vim.api.nvim_get_option("columns")
	local lines = vim.api.nvim_get_option("lines")

	local columns_threshold = 80
	local lines_threshold = 40

	if columns < columns_threshold or lines < lines_threshold then
		-- Close neo-tree if it's open
		if vim.fn.exists(":Neotree") == 2 then
			vim.cmd("Neotree clode")
		end

		-- Close dap-ui if it's open
		local dapui_ok, dapui = pcall(require, "dapui")
		if dapui_ok then
			dapui.close()
		end
	end
end

-- Autocmd to trigger close_sidebars if the window is resized
vim.api.nvim_create_autocmd("VimResized", {
	callback = close_sidebars,
})

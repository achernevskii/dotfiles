return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			-- Adapters
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			local dap = require("dap")
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>dbc", function()
				local line = vim.fn.line(".")
				local file = vim.fn.expand("%:p")

				-- Check if breakpoint exists on the current line
				local breakpoints = dap.list_breakpoints() or {}
				local breakpoint_exists = false
				for _, bp in pairs(breakpoints[file] or {}) do
					if bp.file == file and bp.line == line then
						breakpoint_exists = true
						break
					end
				end

				if not breakpoint_exists then
					-- Prompt for condition
					local condition = vim.fn.input("Breakpoint condition: ")
					dap.toggle_breakpoint(condition)
				else
					dap.toggle_breakpoint()
				end
			end, {})
			vim.keymap.set("n", "<leader>dc", dap.continue, {})
			vim.keymap.set("n", "<leader>do", dap.step_over, {})
			vim.keymap.set("n", "<leader>di", dap.step_into, {})
			vim.keymap.set("n", "<leader>doo", dap.step_out, {})
			vim.keymap.set("n", "<leader>drc", dap.run_to_cursor, {})

			local dapui = require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			--dap.listeners.before.event_terminated.dapui_config = function()
			--	dapui.close()
			--end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<leader>dq", dapui.toggle, {})

			dapui.setup({
				icons = { expanded = "▼", collapsed = ">" },
				layouts = {
					{
						elements = {
							{ id = "scopes",      size = 0.50 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stacks",      size = 0.25 },
							--{ id = "watches", size = 0.25 },
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							"repl",
							"console",
						},
						size = 15,
						position = "bottom",
					},
				},
			})

			vim.api.nvim_create_autocmd("VimResized", {
				pattern = "*",
				callback = function()
					-- Check if dapui windows are open
					local windows = dapui.windows
					if windows and #windows > 0 then
						dapui.close()
						dapui.open()
					end
				end,
			})

			-- DAP-Go configuration
			local dapgo = require("dap-go")
			dapgo.setup({
				dap_configurations = {
					{
						-- Must be "go" or it will be ignored by the plugin
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
						port = 38697,
						host = "127.0.0.1",
					},
					{
						type = "go",
						name = "Debug Package (Arguments)",
						request = "launch",
						program = "${fileDirname}",
						args = dapgo.get_arguments,
					},
				},
			})

			-- DAP-Python configuration
			require("dap-python").setup("python")
		end,
	},
}

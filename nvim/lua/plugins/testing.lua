return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- Adapters
			"nvim-neotest/neotest-python",
			"fredrikaverpil/neotest-golang",
		},
		config = function()
			local neotest = require("neotest")

			neotest.setup({
				adapters = {
					require("neotest-python"),
					require("neotest-golang"),
				},
				icons = {
					passed = "+",
					running = '◯',
					failed = 'x',
					unknown = "?",
				},
			})

			-- Run the nearest test
			vim.keymap.set("n", "<leader>tc", function()
				neotest.run.run()
			end, {})
			-- Run all the tests in the current buffer
			vim.keymap.set("n", "<leader>tf", function()
				neotest.run.run(vim.fn.expand("%"))
			end, {})
			-- Run the last test
			vim.keymap.set("n", "<leader>tt", function()
				neotest.run.run_last()
			end, {})
			-- Output of the nearest test
			vim.keymap.set("n", "<leader>to", function()
				neotest.output.open({ enter = true })
			end, {})
			-- Output panel of all the tests
			vim.keymap.set("n", "<leader>tr", function()
				neotest.output_panel.toggle()
			end, {})
		end,
	},
}

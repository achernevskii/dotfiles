return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			{
				"nvim-treesitter/nvim-treesitter",
				branch = "main", -- main is required by neotest-golang
				build = function()
					vim.cmd(":TSUpdate go")
				end,
			},
			-- Adapters
			--"nvim-neotest/neotest-python",
			--"nvim-neotest/neotest-go",
			{
				"fredrikaverpil/neotest-golang",
				version = "*",                               -- Optional, but recommended; track releases
				build = function()
					vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
				end,
			},
		},
		config = function()
			local neotest = require("neotest")

			neotest.setup({
				adapters = {
					--require("neotest-python"),
					require("neotest-golang")({
						runner = "gotestsum", -- Optional, but recommended
						warn_test_name_dupes = false,
					}),
				},
				icons = {
					passed = "+",
					running = "◯",
					failed = "x",
					unknown = "?",
					skipped = "s",
				},
			})

			-- Run the nearest test
			vim.keymap.set("n", "<leader>tc", function()
				neotest.run.run()
			end, {})
			-- Debug the nearest test
			vim.keymap.set("n", "<leader>dt", function()
				neotest.run.run({ strategy = "dap" })
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
			-- Test summary
			vim.keymap.set("n", "<leader>ts", function()
				neotest.summary.toggle()
			end, {})
		end,
	},
}

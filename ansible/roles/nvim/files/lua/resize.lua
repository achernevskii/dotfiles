-- Redraw vim UI when the neovim focus is regained, or the size of NeoVim is changed
vim.api.nvim_create_autocmd({ "VimResized", "FocusGained" }, {
  callback = function()
    vim.cmd("redraw!")
  end,
})


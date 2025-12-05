local function compare_to_clipboard()
  local ftype = vim.bo.filetype

  -- Yank the visual selection into register x
  vim.cmd('normal! "xy')

  -- Open a vertical split and show the clipboard content in a scratch buffer
  vim.cmd('vsplit | enew')
  vim.cmd(string.format('set filetype=%s', ftype))
  vim.cmd('file [Clipboard]') -- set buffer name
  vim.cmd('normal! "+P')  -- paste from system clipboard
  vim.cmd('setlocal buftype=nofile bufhidden=wipe noswapfile')
  vim.cmd('setlocal nomodifiable')
  vim.cmd('diffthis')

  -- Go back to original buffer (where selection was made)
  vim.cmd('wincmd p')
  vim.cmd('diffthis')  -- turn on diff in original file (modifiable!)
end

vim.keymap.set('x', '<Space>cc', compare_to_clipboard, { desc = "Compare selection to clipboard" })


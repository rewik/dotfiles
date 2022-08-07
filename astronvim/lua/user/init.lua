local config = {
  polish = function()
    --vim.opt.list = true
    --vim.opt.listchars.tab = '▸ '
    --vim.opt.listchars.trail = '·'
    vim.api.nvim_set_keymap('n', 'L', ':tabn<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', 'H', ':tabp<cr>', { noremap = true })
  end,
}
return config

local ok, bufferline = pcall(require, 'bufferline')
if not ok then
  return
end

bufferline.setup({})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Tab>', [[<Cmd>BufferLineCycleNext<CR>]], opts)
vim.api.nvim_set_keymap('n', '<S-Tab>', [[<Cmd>BufferLineCyclePrev<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>bdelete!<cr>', opts)

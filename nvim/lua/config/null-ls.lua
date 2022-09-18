local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

null_ls.setup({
	require("null-ls").builtins.formatting.stylua,
    -- require("null-ls").builtins.diagnostics.eslint,

	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("nnoremap <silent><buffer> <space>f :lua vim.lsp.buf.formatting()<CR>")

			-- format on save
			-- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
		end

		if client.server_capabilities.documentRangeFormattingProvider then
			vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
		end
	end,
})

-- use Format command to format
vim.api.nvim_create_user_command(
  'FormatDocument',
  ":lua vim.lsp.buf.formatting({})",
	{range=1}
)

vim.api.nvim_create_user_command(
  'FormatSlection',
  ":lua vim.lsp.buf.range_formatting({})",
	{range=1}
)

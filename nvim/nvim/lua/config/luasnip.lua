local ok, luasnip = pcall(require, 'luasnip')
if not ok then
  return
end

luasnip.setup({})

require("luasnip.loaders.from_vscode").lazy_load()

local snippets_folder = vim.fn.stdpath "config" .. "/lua/snippets/"
require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder }
vim.cmd [[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]


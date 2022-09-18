-- colorscheme
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd('colorscheme onedark')

-- enable mouse
vim.opt.mouse = 'a'

-- sync nvim clipboard with system clipboard
vim.opt.clipboard = "unnamedplus"

-- enable line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- highlight current cursor line
vim.opt.cursorline = true

-- change scrolloff size
-- vim.opt.scrolloff = 10

-- change update time, fix CursorHold error
vim.opt.updatetime = 400

-- tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true


-- searching and replacing settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true 
vim.opt.showmode = false --Show the mode you are in on the last line
vim.opt.inccommand = "split"

-- folding settings
vim.opt.foldmethod = "syntax"
vim.opt.foldenable = false

--vim.api.nvim_command([[]]) to run multiple vim-script command
--vim.cmd() to run single vim-script command

-- Enable background buffers
vim.opt.hidden = true

-- Terminal mappings
local opts = { noremap = true, silent = true } 
vim.api.nvim_set_keymap('n', '<space>t', ':sp|resize 12|term<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Lua snip
vim.api.nvim_set_keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.api.nvim_set_keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.api.nvim_set_keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
vim.api.nvim_set_keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

-- Build c++ file with F5 and F6 keys
vim.cmd([[
	autocmd filetype cpp nnoremap <F6> :w <bar> !rm %:r; g++ -ulimit -Wall -Wno-unused-result -g -O2   % -o %:r <CR> :sp<bar>resize 12<bar>term ./%:r < ./input.txt <CR>
	autocmd filetype cpp nnoremap <F5> :w <bar> !rm %:r; g++ -ulimit -Wall -Wno-unused-result -g -O2   % -o %:r <CR> :sp<bar>resize 12<bar>term ./%:r <CR>
        autocmd filetype cpp nnoremap <F10> :w <bar> !rm %:r; g++ -ulimit -Wall -Wno-unused-result -g -O2   % -o %:r <CR> :vs<bar>term gdb -tui %:r <CR>

]])

-- open links in browser on wsl
vim.cmd("au BufEnter * let g:netrw_browsex_viewer=\"cmd.exe /C start\"")

-- start insert mode when open terminal
-- vim.cmd([[autocmd BufWinEnter,WinEnter term://* startinsert]])

vim.api.nvim_create_user_command(
    'ChangeTabSize', 
    function(opts) 
        -- foldcus.fold(tonumber(opts.args))   
        vim.opt.tabstop = tonumber(opts.args)
        vim.opt.softtabstop =  tonumber(opts.args)
        vim.opt.shiftwidth = tonumber(opts.args)
    end, 
    { nargs = '*' }
)

vim.api.nvim_create_user_command(
    'DebugCurrentFile', 
    function() 
    vim.cmd([[execute ":w \| !rm %:r; g++ -ulimit -Wall -Wno-unused-result -g -O2   % -o %:r"]])
    vim.cmd([[execute ":vs\|term gdb -tui %:r"]])
    end, 
    { nargs = '*' }
)


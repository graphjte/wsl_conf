local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

nvim_tree.setup({
  sort_by = "case_sensitive",
  disable_netrw = false,
  update_cwd = true,   
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  update_focused_file = {
      enable = true,
      update_cwd = true,
  },
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 32,
    height = 30,
    hide_root_folder = false,
    side = "left",  
    relativenumber = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = { 
    group_empty = true,
    icons = { 
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  }, 
    hijack_directories = {
    enable = true,
    auto_open = true,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
    },
    remove_file = {
      close_window = true,
    },
  },
})

vim.api.nvim_set_keymap('n', '<Leader>t', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

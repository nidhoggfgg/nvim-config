local present, nvimtree = pcall(require, "nvim-tree")
if not present then
    return
end
local g = vim.g

g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
-- g.nvim_tree_indent_markers = 1
-- g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
--
g.nvim_tree_show_icons = {
    folders = 1,
    -- folder_arrows= 1
    files = 1,
    git = git_status,
}

-- [[
g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "★",
    },
    folder = {
        -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
        -- arrow_open = "",
        -- arrow_closed = "",
        default = "",
        empty = "", -- 
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = "",
    },
}
--]]

local tree_cb = require("nvim-tree.config").nvim_tree_callback
nvimtree.setup {
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_netrw = true,
    ignore_ft_on_setup = { "dashboard" },
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    view = {
        allow_resize = true,
        side = "left",
        width = 25,
        mappings = {
            custom_only = true,
            list = {
                { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
                -- { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
                { key = "<leader>v",                    cb = tree_cb("vsplit") },
                { key = "<leader>x",                        cb = tree_cb("split") },
                -- { key = "<C-t>",                        cb = tree_cb("tabnew") },
                -- { key = "<",                            cb = tree_cb("prev_sibling") },
                -- { key = ">",                            cb = tree_cb("next_sibling") },
                -- { key = "P",                            cb = tree_cb("parent_node") },
                -- { key = "<BS>",                         cb = tree_cb("close_node") },
                -- { key = "<S-CR>",                       cb = tree_cb("close_node") },
                -- { key = "<Tab>",                        cb = tree_cb("preview") },
                -- { key = "K",                            cb = tree_cb("first_sibling") },
                -- { key = "J",                            cb = tree_cb("last_sibling") },
                -- { key = "I",                            cb = tree_cb("toggle_ignored") },
                -- { key = "H",                            cb = tree_cb("toggle_dotfiles") },
                { key = "R",                            cb = tree_cb("refresh") },
                { key = "a",                            cb = tree_cb("create") },
                { key = "d",                            cb = tree_cb("remove") },
                { key = "r",                            cb = tree_cb("rename") },
                -- { key = "<C-r>",                        cb = tree_cb("full_rename") },
                { key = "x",                            cb = tree_cb("cut") },
                { key = "c",                            cb = tree_cb("copy") },
                { key = "p",                            cb = tree_cb("paste") },
                { key = "y",                            cb = tree_cb("copy_name") },
                { key = "Y",                            cb = tree_cb("copy_path") },
                -- { key = "gy",                           cb = tree_cb("copy_absolute_path") },
                -- { key = "[c",                           cb = tree_cb("prev_git_item") },
                -- { key = "]c",                           cb = tree_cb("next_git_item") },
                -- { key = "-",                            cb = tree_cb("dir_up") },
                -- { key = "s",                            cb = tree_cb("system_open") },
                -- { key = "q",                            cb = tree_cb("close") },
                -- { key = "g?",                           cb = tree_cb("toggle_help") },
            }
        }
    },
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<C-n>", ":NvimTreeToggle <CR>", opts)
map("n", "<leader>e", ":NvimTreeFocus <CR>", opts)


local M = {
    -- ui
    bufferline = {
        buffer_next = "<Tab>",
        buffer_prev = "<S-Tab>",
        buffer_delete = "<leader>x"
    },

    lspconfig = {
        goto_declaration = "gD",
        goto_definition = "gd",
        hover = "K",
        goto_impl = "gi",
        sign_help = "<C-k>",
        add_workspace_folder = "<Space>wa",
        remove_workspace_folder = "<Space>wr",
        workspace_list = "<Space>wl",
        type_definition = "<Space>D",
        rename = "<Space>rn",
        code_action = "<Space>ca",
        references = "gr",
        show_line_diagnostics = "<Space>e",
        diagnostic_goto_prev = "[d",
        diagnostic_goto_next = "]d",
        diagnostic_set_locline = "<Space>q",
        formatting = "<Space>f"
    },

    cmp = {
        select_prev_item = "<C-p>",
        select_next_item = "<C-n>",
        scroll_docs_up = "<C-d>",
        scroll_docs_down = "<C-f>",
        complete = "<C-Space>",
        close = "<C-e>",
        confirm = "<CR>"
    },

    dap = {
        toggle_breakpoint = "<leader>b",
        start_and_continue = "<F5>",
        step_over = "<F10>",
        step_into = "<F11>",
        step_out = "<F12>"
    },

    nvimtree = {
        toggle = "<C-n>",
        focus = "<leader>e",
        edit = { "<CR>", "o", "<2-LeftMouse>" },
        vsplit = "<leader>v",
        split = "<leader>x",
        refresh = "R",
        create = "a",
        remove = "d",
        rename = "r",
        cut = "x",
        copy = "c",
        paste = "p",
        copy_name = "y",
        copy_path = "Y"
    },

    telescope = {
        
    },

    better_escape = {
        esc_insert = { "jk", "kj" }
    }
}

return M

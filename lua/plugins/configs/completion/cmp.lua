local present, cmp = pcall(require, "cmp")
if not present then
    return
end

vim.opt.completeopt = "menuone,noselect"

local pm = require("plugins.mappings").cmp

local icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = string.format(
            "%s %s",
            icons[vim_item.kind],
            vim_item.kind
            )

            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                buffer = "[BUF]",
            })[entry.source.name]

            return vim_item
        end,
    },
    mapping = {
        [pm.select_prev_item] = cmp.mapping.select_prev_item(),
        [pm.select_next_item] = cmp.mapping.select_next_item(),
        [pm.scroll_docs_up] = cmp.mapping.scroll_docs(-4),
        [pm.scroll_docs_down] = cmp.mapping.scroll_docs(4),
        [pm.complete] = cmp.mapping.complete(),
        [pm.close] = cmp.mapping.close(),
        [pm.confirm] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            local next_char = string.sub(vim.fn.getline("."), vim.fn.col("."), vim.fn.col("."))
            if cmp.visible() then
                cmp.select_next_item()
            elseif next_char == ')' or next_char == ']' or next_char == '"' or next_char == '\'' or next_char == '}' or next_char == '>' then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, true, true), "")
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
                fallback()
            end
        end, {"i", "s"}), 
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
                fallback()
            end
        end, {"i", "s"}),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
    },
}


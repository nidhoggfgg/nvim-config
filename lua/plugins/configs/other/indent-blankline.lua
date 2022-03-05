local present, blankline = pcall(require, "indent_blankline")
if not present then
    return
end

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

blankline.setup {
    show_end_of_line = true
}


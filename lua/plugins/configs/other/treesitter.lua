local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

treesitter.setup {
    ensure_installed = {
        "lua",
        "rust",
        "python",
        "javascript",
        "html",
        "css",
        "json",
        "css",
        "bash",
        "cpp",
        "java",
        "c"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 100000
    },
    autotag = {
        enable = true
    }
}

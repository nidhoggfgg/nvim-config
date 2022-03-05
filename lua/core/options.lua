local options = {
    -- 搜索
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,

    -- 缩进
    expandtab = true,
    smarttab = true,
    shiftround = true,
    smartindent = true,
    autoindent = true,
    shiftwidth = 4,
    tabstop = 4,
    
    -- 命令
    cmdheight = 1,
    history = 100,

    -- 行号
    number = true,
    relativenumber = true,

    -- undo, swap, backup
    undofile = true,
    swapfile = false,
    backup = false,

    -- 编码
    encoding = "utf-8",

    -- 界面
    title = true,
    cursorline = true,
    scrolloff = 10,
    sidescrolloff = 5,
    wrap = false,
    termguicolors = true,

    -- 其他
    mouse = "a",
    autoread = true,
    clipboard = unnamedplus,
    -- autochdir = true,
    completeopt = "menuone,noselect"
}

for name, value in pairs(options) do
    vim.o[name] = value
end

local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

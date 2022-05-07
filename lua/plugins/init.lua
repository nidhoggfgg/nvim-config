local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    if packer_bootstrap then
        require("packer").sync()
    else
        error("Couldn't clone packer, please check your network:)")
    end
end

return require("packer").startup(function(use)
    use { "wbthomason/packer.nvim" }

    -- ui
    use { "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function() require("plugins.configs.ui.lualine") end,
    }

    use { "akinsho/bufferline.nvim",
        after = "nvim-web-devicons",
        config = function() require("plugins.configs.ui.bufferline") end,
        requires = "kyazdani42/nvim-web-devicons"
    }

    use { "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        tag = "release",
        config = function() require("gitsigns").setup() end
    }

    -- theme
    use { "folke/tokyonight.nvim",
        after = "packer.nvim",
        config = function() vim.cmd[[colorscheme tokyonight]] end
    }

    -- highlight
    use { "nvim-treesitter/nvim-treesitter",
        event = "BufRead",
        config = function() require("plugins.configs.other.treesitter") end,
        branch = "0.5-compat",
        run = ":TSUpdate"
    }

    use { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" }

    -- lsp
    use { "neovim/nvim-lspconfig", config = function() require("plugins.configs.lsp.lspconfig") end }

    -- use { "williamboman/nvim-lsp-installer",
    --     after = "nvim-lspconfig",
    --     config = function() require("plugins.configs.lsp.lsp-installer") end
    -- }

    use { "glepnir/lspsaga.nvim",
        after = "nvim-lspconfig",
        config = function() require("plugins.configs.lsp.lspsaga") end
    }

    -- use { "ms-jpq/coq.artifacts",
    --     branch = "artifacts",
    -- }
    --
    -- use { "ms-jpq/coq_nvim",
    --     branch = "coq",
    --     config = function() require("plugins.configs.completion.coq") end
    -- }

    -- completion
    use { "rafamadriz/friendly-snippets", event = "InsertEnter" }

    use { "hrsh7th/nvim-cmp",
        after = "friendly-snippets",
        config = function() require("plugins.configs.completion.cmp") end
    }

    use { "L3MON4D3/LuaSnip",
        after = "nvim-cmp",
        config = function() require("plugins.configs.completion.luasnip") end,
        wants = "friendly-snippets"
    }

    use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }

    use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }

    use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }

    use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }

    use { "hrsh7th/cmp-path", after = "cmp-buffer" }

    use { "windwp/nvim-autopairs",
       after = "nvim-cmp",
       config = function() require("plugins.configs.completion.autopairs") end
    }

    -- debug
    use { "mfussenegger/nvim-dap",
        config = function() require("plugins.configs.debug.dap") end
    }

    use { "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        after = "nvim-dap",
        config = function() require("plugins.configs.debug.dap-ui") end
    }

    use { "theHamsta/nvim-dap-virtual-text",
        after = "nvim-dap",
        config = function() require("nvim-dap-virtual-text").setup() end,
        require = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" }
    }

    -- widgets
    use { "nvim-telescope/telescope.nvim",
        config = function() require("plugins.configs.widgets.telescope") end,
        requires = "nvim-lua/plenary.nvim",
        cmd = "Telescope"
    }

    use { "kyazdani42/nvim-tree.lua",
        after = "nvim-web-devicons",
        config = function() require("plugins.configs.widgets.nvimtree") end,
        requires = "kyazdani42/nvim-web-devicons"
    }

    use { "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim"
    }

    -- other
    use { "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function() require("plugins.configs.other.indent-blankline") end
    }

    use { "kyazdani42/nvim-web-devicons",
        after = "packer.nvim",
        config = function() require("plugins.configs.other.web-devicons") end
    }

    use { "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function() require("plugins.configs.other.better-escape") end
    }

    use { "ahmedkhalf/project.nvim",
        config = function() require("project_nvim").setup() end
    }

    use { "numToStr/Comment.nvim",
        event = "VimEnter",
        config = function() require("Comment").setup() end
    }

    use { "famiu/bufdelete.nvim", cmd = "Bdelete" }

    use { "wakatime/vim-wakatime" }

end)


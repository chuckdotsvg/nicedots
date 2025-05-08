return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- load the colorscheme here
            vim.cmd.colorscheme "tokyonight-night"
        end,
    },

    --[[ {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    'ruff',
                },
                automatic_installation = false,
                handlers = {},
            })

            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- Ruff for linting
                    null_ls.builtins.diagnostics.ruff,

                    -- Ruff for formatting (new in Ruff >=0.0.291)
                    null_ls.builtins.formatting.ruff,
                },
            })
        end,
    }, ]]

    { "williamboman/mason-lspconfig.nvim" },
    { "williamboman/mason.nvim" },

    -- { "mfussenegger/nvim-jdtls" },

    {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup() end
    },

    {
        'nvim-treesitter/nvim-treesitter-context',
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function() require("nvim-autopairs").setup {} end
    },

    {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end,
    },

    {
        "mbbill/undotree",
        cmd = "UndotreeToggle"
    },

    {
        'andweeb/presence.nvim',
        enabled = false,
        config = function() require("presence").setup({}) end,
    },

    {
        "iamcco/markdown-preview.nvim",
        enabled = true,
        ft = "markdown",
        config = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function() require("gitsigns").setup() end,
    },

    {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require("notify")

            require('notify').setup({
                render = 'wrapped-compact',
                stages = 'slide',
            })
        end
    },

    { "luckasRanarison/tree-sitter-hypr" },

    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
    },

    {
        'github/copilot.vim',
    },

    -- { 'f-person/auto-dark-mode.nvim' },
}

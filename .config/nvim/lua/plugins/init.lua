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

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

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
        "lukas-reineke/indent-blankline.nvim",
        event = "BufWinEnter"
    },

    { "mbbill/undotree", cmd = "UndotreeToggle" },

    {
        'andweeb/presence.nvim',
        config = function() require("presence").setup({}) end,
    },

    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        config = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function() require("gitsigns").setup() end,
    },

    {
        'rcarriga/nvim-notify',
        config = function ()
            vim.notify = require("notify")

            require('notify').setup({
                render = 'wrapped-compact',
                stages = 'slide',
            })
        end
    },

}

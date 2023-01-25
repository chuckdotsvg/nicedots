return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "kylechui/nvim-surround",
        config = function() require("nvim-surround").setup() end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function() require("nvim-autopairs").setup {} end
    },
    --[[ {
        'ms-jpq/coq_nvim',
        event = "InsertEnter",
        commit = "5eddd31bf8a98d1b893b0101047d0bb31ed20c49",
        config = function() coq.Now("--shut-up") end,
        dependencies = {
            'ms-jpq/coq.artifacts',
            'ms-jpq/coq.thirdparty',
        }
    }, ]]
    {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufWinEnter"
    },
    { "mbbill/undotree", cmd = "UndotreeToggle" }
}

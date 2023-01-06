return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup{
                enable_check_bracket_line = false,
            }
        end
    },

    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = "Telescope",
    },

    {
        "folke/which-key.nvim",
        event = "BufWinEnter", -- Actually lazy-loading inside indent_blankline
    },

    --{
    --    "rcarriga/nvim-notify",
    --    config = function()
    --        require("notify").setup()
    --        vim.notify = require("notify")
    --        vim.notify("This is an error message", "error")
    --    end,
    --}
}

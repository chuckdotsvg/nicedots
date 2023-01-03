return {
    "folke/twilight.nvim",

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },

    {
        "jiangmiao/auto-pairs",
        -- lazy = true,
        -- event = ,
    },

    {
        "tpope/vim-surround",
        -- lazy = true,
        -- event = ,
    },


    {
        "williamboman/mason.nvim",
        config = function ()
            require("mason").setup()
        end,
        dependencies = {
            {
                "williamboman/mason-lspconfig.nvim",
                config = function ()
                    require("mason-lspconfig").setup()
                    require("mason-lspconfig").setup_handlers {
                        -- The first entry (without a key) will be the default handler
                        -- and will be called for each installed server that doesn't have
                        -- a dedicated handler.
                        function (server_name) -- default handler (optional)
                            require("lspconfig")[server_name].setup {}
                        end,
                        -- Next, you can provide a dedicated handler for specific servers.
                        -- For example, a handler override for the rust_analyzer:
                        ["rust_analyzer"] = function ()
                            require("rust-tools").setup {}
                        end
                    }
                end,
            },

            {
                "neovim/nvim-lspconfig",
                config = function()
                    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
                    for type, icon in pairs(signs) do
                        local hl = "DiagnosticSign" .. type
                        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
                    end
                end,
            },

        },
    },

    {
        "ms-jpq/coq_nvim",
        event = "InsertEnter",
        lazy = true,
        build = ":COQdeps",
        dependencies = {
            'ms-jpq/coq.artifacts',
            'ms-jpq/coq.thirdparty',
        },
        config = function()
            vim.cmd('COQnow -s')
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        dependencies = "nvim-lua/plenary.nvim",
    },

    -- {
    --    'nvim-treesitter/nvim-treesitter',
    --    build = function()
    --        require('nvim-treesitter.install').update({ with_sync = true })
    --    end,
    -- }
}

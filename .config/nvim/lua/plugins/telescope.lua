local M = {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    -- tag = '0.1.1',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
    },
}

function M.config()
    require('telescope').setup {
        pickers = {
            find_files = { theme = "dropdown" },
            grep_string = { theme = "dropdown" },
            buffers = { theme = "dropdown" },
            help_tags = { theme = "dropdown" },
        },

        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown{}
            }
        },

        vim.keymap.set('n', '<leader>tf', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true }),
        vim.keymap.set('n', '<leader>tg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true }),
        vim.keymap.set('n', '<leader>tb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true }),
        vim.keymap.set('n', '<leader>th', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true }),
    }

    require("telescope").load_extension("ui-select")
end

return M

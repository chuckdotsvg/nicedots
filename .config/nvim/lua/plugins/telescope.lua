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
        }
    }

    require("telescope").load_extension("ui-select")
end

return M

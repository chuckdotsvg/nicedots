local M = {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    -- tag = '0.1.1',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
}

function M.config()
    require('telescope').setup {
        pickers = {
            find_files = { theme = "dropdown" },
            grep_string = { theme = "dropdown" },
            buffers = { theme = "dropdown" },
            help_tags = { theme = "dropdown" },
        }
    }
end

return M

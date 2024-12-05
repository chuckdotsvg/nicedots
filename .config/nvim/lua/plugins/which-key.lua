local M = {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        })
    end,
}

function M.config()
    local wk = require("which-key")
    local ts = require("telescope.builtin")

    --[[ wk.add({
        ["<leader>"] = {
            t = {
                name = "+Telescope",
                f = { ts.find_files, "Find File" },
                g = { ts.live_grep, "Live Grep" },
                b = { ts.buffers, "Look opened buffers" },
                h = { ts.help_tags, "The Holy Bible" },
            },
            ["ut"] = { "<cmd>UndotreeToggle<cr>", "Toggle undo-history" },
        }
    }) ]]
end

return M

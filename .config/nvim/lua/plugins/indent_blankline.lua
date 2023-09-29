local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    main = "ibl";
    enabled = true,
}

function M.config()

    require("ibl").setup({
        use_treesitter_scope = false,
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = true,
        buftype_exclude = {
            "terminal",
            "nofile",
            "Telescope",
            "Mason",
        },
        --[[ filetype_exclude = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "neo-tree",
            "Trouble",
        }, ]]
        context_patterns = {
            "class",
            "return",
            "function",
            "method",
            "^if",
            "^while",
            "jsx_element",
            "^for",
            "^object",
            "^table",
            "block",
            "arguments",
            "if_statement",
            "else_clause",
            "jsx_element",
            "jsx_self_closing_element",
            "try_statement",
            "catch_clause",
            "import_statement",
            "operation_type",
        },
    })
end

return M

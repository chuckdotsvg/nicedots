local M = {
    -- LSP Support
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
        dependencies = {
            {
                'williamboman/mason-lspconfig.nvim',
                config = function()
                    require("mason-lspconfig").setup()
                    require("mason-lspconfig").setup_handlers({
                        function()
                            -- Set up lspconfig
                            local lspconfig = require('lspconfig')
                            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
                            local get_servers = require('mason-lspconfig').get_installed_servers

                            local on_attach = function ()
                                local remap = function (mode, lhs, rhs)
                                    local opts = { buffer = 0 }
                                    vim.keymap.set(mode, lhs, rhs, opts)
                                end

                                remap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

                                -- Jump to the definition
                                remap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

                                -- Jump to declaration
                                remap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

                                -- Lists all the implementations for the symbol under the cursor
                                remap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

                                -- Jumps to the definition of the type symbol
                                remap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

                                -- Lists all the references 
                                remap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

                                -- Displays a function's signature information
                                remap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

                                -- Renames all references to the symbol under the cursor
                                remap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

                                -- Selects a code action available at the current cursor position
                                remap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
                                remap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

                                -- Show diagnostics in a floating window
                                remap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

                                -- Move to the previous diagnostic
                                remap('n', '<leader>dk', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
                                -- Move to the next diagnostic
                                remap('n', '<leader>dj', '<cmd>lua vim.diagnostic.goto_next()<cr>')

                                -- use telescope for list errors in files
                                remap('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>')

                                -- find and replace "intelligent way"
                                remap("n", "<leader>r", vim.lsp.buf.rename)

                                -- open code actions
                                remap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
                            end

                            local handlers = {
                                ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
                                ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"}),
                            }

                            for _, server_name in ipairs(get_servers()) do
                                lspconfig[server_name].setup {
                                    on_attach = on_attach,
                                    capabilities = lsp_capabilities,
                                    handlers = handlers,
                                }
                            end
                        end
                    })
                end,
                dependencies = {
                    {
                        'neovim/nvim-lspconfig',
                        config = function ()
                            local signs = {
                                Error = " ",
                                Warn = " ",
                                Hint = " ",
                                Info = " "
                            }

                            for type, icon in pairs(signs) do
                                local hl = "DiagnosticSign" .. type
                                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })

                                vim.diagnostic.config({
                                    float = { border = "rounded" }
                                })
                            end
                        end
                    },
                },
            },
        },
    },
}

return M

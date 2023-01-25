local M = {
    'neovim/nvim-lspconfig',
}

function M.config()
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local remap = vim.keymap.set
    local lspopt = vim.lsp
    local opts = { noremap = true, silent = true }
    remap('n', '<leader>e', vim.diagnostic.open_float, opts)
    remap('n', '<leader>dk', vim.diagnostic.goto_prev, opts)
    remap('n', '<leader>dj', vim.diagnostic.goto_next, opts)
    remap('n', '<leader>q', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help lspopt.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        remap('n', 'gD', lspopt.buf.declaration, bufopts)
        remap('n', 'gd', lspopt.buf.definition, bufopts)
        remap('n', 'K', lspopt.buf.hover, bufopts)
        remap('n', '<leader>gi', lspopt.buf.implementation, bufopts)
        remap('n', '<C-k>', lspopt.buf.signature_help, bufopts)
        remap('n', '<leader>wa', lspopt.buf.add_workspace_folder, bufopts)
        remap('n', '<leader>wr', lspopt.buf.remove_workspace_folder, bufopts)
        remap('n', '<leader>wl', function()
            print(vim.inspect(lspopt.buf.list_workspace_folders()))
        end, bufopts)
        remap('n', '<leader>D', lspopt.buf.type_definition, bufopts)
        remap('n', '<leader>rn', lspopt.buf.rename, bufopts)
        remap('n', '<leader>ca', lspopt.buf.code_action, bufopts)
        remap('n', 'gr', lspopt.buf.references, bufopts)
        remap('n', '<leader>f', function() lspopt.buf.format { async = true } end, bufopts)
    end

    local handlers = {
        ["textDocument/hover"] = lspopt.with(lspopt.handlers.hover, { border = "single" }),
        ["textDocument/signatureHelp"] = lspopt.with(lspopt.handlers.signature_help, { border = "single" }),
    }

    vim.diagnostic.config {
        float = { border = "single" }
    }

    -- Add additional capabilities supported by nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require('lspconfig')

    require("mason").setup()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers {
        function(server_name)
            lspconfig[server_name].setup {
                -- lspconfig[server_name].setup(require('coq').lsp_ensure_capabilities({
                on_attach = on_attach,
                handlers = handlers,
                capabilities = capabilities,
                -- }))
            }
        end,
    }

    -- Server overrides
    lspconfig.sumneko_lua.setup {
        on_attach = on_attach,
        handlers = handlers,
        capabilities = capabilities,

        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    }

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

return M

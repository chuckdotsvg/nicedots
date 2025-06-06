local M = {
    'neovim/nvim-lspconfig',
}

function M.config()
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
            bufopts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end

    local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
    }

    vim.diagnostic.config {
        float = { border = "single" }
    }

    -- Add additional capabilities supported by nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require('lspconfig')

    require("mason").setup()
    require("mason-lspconfig").setup()
    -- local servers = require("mason-lspconfig").get_installed_servers()

    --[[ local function getIndex(tab, val)
        local index = nil
        for i, v in ipairs(tab) do
            if (v == val) then
                index = i
            end
        end
        return index
    end ]]
    -- local custom = {"lua_ls", "jdtls"}

    --[[ for _, srv in ipairs(custom) do
        local idx = getIndex(servers, srv)
        table.remove(servers, idx)
    end ]]
    require("mason-lspconfig").setup_handlers {
        function(server_name)
            -- for _, server_name in ipairs(servers) do
            lspconfig[server_name].setup {
                on_attach = on_attach,
                handlers = handlers,
                capabilities = capabilities,
            }
        end,

        -- Server overrides
        ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
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
        end,

        ["clangd"] = function()
            lspconfig.clangd.setup {
                on_attach = on_attach,
                handlers = handlers,
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                }
            }
        end,

        ["jdtls"] = function()
            lspconfig.jdtls.setup {
                on_attach = on_attach,
                handlers = handlers,
                capabilities = capabilities,
                cmd = {
                    "jdtls",
                    "--offset-encoding=utf-16",
                }
            }
        end,

        -- start manually
        -- ["jdtls"] = function () end,

    }

    local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

return M

vim.opt_local.spell = true
vim.api.nvim_create_augroup("Markdown", {clear = true})

vim.api.nvim_create_autocmd("BufWritePost", {
    command = "!pandoc --pdf-engine=weasyprint <afile> -o %:r.pdf",
    group = "Markdown",
    pattern = "*.md",
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = 0 }

-- search markdown links
map("n", "<Tab>", "<Cmd>call search('\\[[^]]*\\]([^)]\\+)')<CR>", opts)
map("n", "<S-Tab>", "<Cmd>call search('\\[[^]]*\\]([^)]\\+)', 'b')<CR>", opts)

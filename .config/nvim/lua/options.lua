local options = {
    backup = false,
    mouse = "",
    termguicolors = true,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    cursorline = true,
    number = true,
    relativenumber = true,
    syntax = "enable",
    list = true,
    signcolumn = "yes",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.listchars:append({
    eol = "↴",
    -- space = "⋅",
})

vim.g.mapleader = ' '

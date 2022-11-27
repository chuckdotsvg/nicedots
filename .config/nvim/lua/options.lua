local options = {
	backup = false,
	mouse = "a",
	-- termguicolors = true,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = true,
    cursorcolumn = true,
	number = true,
    relativenumber = true,
    syntax = enable,
}

-- vim.opt.shortness:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.g.mapleader = "<,>"

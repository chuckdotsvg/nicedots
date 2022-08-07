local options = {
	backup = false,
	mouse = "a",
	-- termguicolors = true,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
  relativenumber = true,
  syntax = enable,
}

-- vim.opt.shortness:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

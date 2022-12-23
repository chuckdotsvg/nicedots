require 'plugins'
require 'options'
require 'colorscheme'

-- require 'autocmds'
-- PLUGINS CONFIG

-- require 'pg/dashboard'
require 'pg/coq'
require 'pg/lualine'
require 'pg/lspconfig'
require 'pg/netrw'

-- save last position
vim.api.nvim_create_autocmd(
	"BufReadPost",
	{ command = [[ if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]] }
)

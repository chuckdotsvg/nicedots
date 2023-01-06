local bind = vim.keymap.set

-- WHICH-KEY otions and keybinds
vim.o.timeoutlen = 300
local wk = require("which-key")
wk.register(mappings, opts)

bind("n", "<left>", "<C-w>h")
bind("n", "<down>", "<C-w>j")
bind("n", "<up>", "<C-w>k")
bind("n", "<right>", "<C-w>l")

-- LEADER
local leader = {
    b = {
        name = "+buffer",
        ["b"] = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
        ["p"] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
        ["["] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
        ["n"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
        ["]"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
        -- ["D"] = { "<cmd>:bd<CR>", "Delete Buffer & Window" },
    },
    f = {
        name = "find",
        ["f"] = { "<cmd>:Telescope find_files<CR>", "Find Files" },
        ["g"] = { "<cmd>:Telescope live_grep<CR>", "Live Grep" },
        ["b"] = { "<cmd>:Telescope buffers<CR>", "Find Buffers" },
        ["h"] = { "<cmd>:Telescope help_tags<CR>", "Help Tags" },
    },
    ["<tab>"] = {
        name = "tabs",
        ["<tab>"] = { "<cmd>tabnew<CR>", "New Tab" },
        n = { "<cmd>tabnext<CR>", "Next" },
        d = { "<cmd>tabclose<CR>", "Close" },
        p = { "<cmd>tabprevious<CR>", "Previous" },
        ["]"] = { "<cmd>tabnext<CR>", "Next" },
        ["["] = { "<cmd>tabprevious<CR>", "Previous" },
        f = { "<cmd>tabfirst<CR>", "First" },
        l = { "<cmd>tablast<CR>", "Last" },
    },
}

wk.register(leader, { prefix = "<leader>" })

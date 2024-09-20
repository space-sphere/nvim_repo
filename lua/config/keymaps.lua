-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
    {
        from = ";",
        to = ":",
        mode = mode_nv,
    },
    { from = "Y", to = '"+y', mode = mode_v },

    -- Movement
    {
        from = "U",
        to = "10k",
        mode = mode_nv,
    },
    {
        from = "J",
        to = "10j",
        mode = mode_nv,
    },
    --向上滚动，不动光标
    {
        from = "<C-Y>",
        to = "10<C-y>",
        mode = mode_nv,
    },
    --向下滚动
    {
        from = "<C-E>",
        to = "10<C-e>",
        mode = mode_nv,
    },
    { from = "ci", to = "cl" },
    { from = "cn", to = "ch" },
    { from = "ck", to = "ci" },
    -- 修改直到匹配的符号
    { from = "c,.", to = "c%" },
    { from = "yh", to = "ye" },

    -- Actions

    -- Useful actions
    {
        from = ",.",
        to = "%",
        mode = mode_nv,
    },
    { from = "<c-y>", to = "<ESC>A {}<ESC>i<CR><ESC>ko", mode = mode_i },
    { from = "\\v", to = "v$h" },
    { from = "<c-a>", to = "<ESC>A", mode = mode_i },

    -- Window & splits
    -- { from = "<leader>w", to = "<C-w>w" },
    -- { from = "<leader>u", to = "<C-w>k" },
    -- { from = "<leader>e", to = "<C-w>j" },
    -- { from = "<leader>n", to = "<C-w>h" },
    -- { from = "<leader>i", to = "<C-w>l" },
    { from = "<up>", to = ":res +5<CR>" },
    { from = "<down>", to = ":res -5<CR>" },
    { from = "<left>", to = ":vertical resize-5<CR>" },
    { from = "<right>", to = ":vertical resize+5<CR>" },
    -- Comments
    { from = "<C-?>", to = "gcc", mode = mode_nv },
    -- 关闭除当前窗口外的其它窗口
    { from = "qf", to = "<C-w>o" },
    --{ from = "s", to = "<nop>" },
    --{ from = "su", to = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>" },
    --{ from = "se", to = ":set splitbelow<CR>:split<CR>" },
    --{ from = "sn", to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>" },
    --{ from = "si", to = ":set splitright<CR>:vsplit<CR>" },
    -- { from = "sh",            to = "se", },
    -- { from = "sh",            to = "<C-w>t<C-w>K", },
    -- { from = "sv",            to = "<C-w>t<C-w>H", },
    { from = "srh", to = "<C-w>b<C-w>K" },
    { from = "srv", to = "<C-w>b<C-w>H" },

    -- Tab management
    { from = "tu", to = ":tabe<CR>" },
    { from = "tU", to = ":tab split<CR>" },
    { from = "tn", to = ":-tabnext<CR>" },
    { from = "ti", to = ":+tabnext<CR>" },
    { from = "tmn", to = ":-tabmove<CR>" },
    { from = "tmi", to = ":+tabmove<CR>" },

    -- Other
    { from = "<leader>sw", to = ":set wrap<CR>" },
    -- { from = "<leader>sc", to = ":set spell!<CR>" },
    { from = "<leader><CR>", to = ":nohlsearch<CR>" },
    { from = "<f10>", to = ":TSHighlightCapturesUnderCursor<CR>" },
    { from = "<leader>o", to = "za" },
    { from = "<leader>pr", to = ":profile start profile.log<CR>:profile func *<CR>:profile file *<CR>" },
    { from = "<leader>rc", to = ":e ~/.config/nvim/init.lua<CR>" },
    { from = "<leader>rv", to = ":e .vim.lua<CR>" },
    { from = ",v", to = "v%" },
    { from = "<leader><esc>", to = "<nop>" },
    { from = "=", to = "nzz", mode = mode_nv },
    { from = "-", to = "Nzz", mode = mode_nv },

    -- Joshuto
    { from = "R", to = ":Joshuto<CR>" },
}

vim.keymap.set("n", "q", "<nop>", { noremap = true })
vim.keymap.set("n", ",q", "q", { noremap = true })

for _, mapping in ipairs(nmappings) do
    vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true, silent = true })
end

local function run_vim_shortcut(shortcut)
    local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
    vim.api.nvim_feedkeys(escaped_shortcut, "n", true)
end

-- close win below
vim.keymap.set("n", "<leader>q", function()
    require("trouble").close()
    local wins = vim.api.nvim_tabpage_list_wins(0)
    if #wins > 1 then
        run_vim_shortcut([[<C-w>j:q<CR>]])
    end
end, { noremap = true, silent = true })

local split = function()
    vim.cmd("set splitbelow")
    vim.cmd("sp")
    vim.cmd("res -5")
end
local compileRun = function()
    vim.cmd("w")
    -- check file type
    local ft = vim.bo.filetype
    if ft == "dart" then
        vim.cmd(":FlutterRun -d " .. vim.g.flutter_default_device .. " " .. vim.g.flutter_run_args)
    elseif ft == "markdown" then
        vim.cmd(":MarkdownPreview")
    elseif ft == "c" then
        split()
        vim.cmd("term gcc % -o %< && ./%< && rm %<")
    elseif ft == "cpp" then
        split()
        vim.cmd("term g++ % -o %< && ./%< && rm %<")
    elseif ft == "javascript" then
        split()
        vim.cmd("term node %")
    elseif ft == "lua" then
        split()
        vim.cmd("term luajit %")
    elseif ft == "tex" then
        vim.cmd(":VimtexCompile")
    elseif ft == "python" then
        split()
        vim.cmd("term python3 %")
    elseif ft == "sh" then
        split()
        vim.cmd("term bash %")
    end
end

vim.keymap.set("n", "r", compileRun, { silent = true })

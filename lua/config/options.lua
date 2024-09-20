-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = true -- 启用普通行号
vim.opt.relativenumber = false -- 禁用相对行号

-- 缩进
vim.opt.tabstop = 4 -- 一个 tab 显示为 4 个空格
vim.opt.shiftwidth = 4 -- 自动缩进时的缩进宽度
vim.opt.expandtab = true -- 使用空格代替 tab

-- 搜索
vim.opt.ignorecase = true -- 搜索时忽略大小写
vim.opt.smartcase = true -- 但如果搜索时包含大写字母，则区分大小写

-- 行尾符号显示
vim.opt.list = true -- 显示空格和tab符号
vim.opt.listchars = { tab = "»·", trail = "·" }

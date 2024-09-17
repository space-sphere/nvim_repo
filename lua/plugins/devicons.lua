-- ~/.config/nvimlua/plugins/devicons.lua
-- -- ~/.config/nvim/lua/plugins/devicons.lua

return {
    {
        "ryanoasis/vim-devicons",
        config = function()
            -- 插件的配置选项
            vim.g.DevIconsEnableFoldersOpenClose = 1
        end,
    },
}

-- ~/.config/nvimlua/plugins/devicons.lua
-- -- ~/.config/nvim/lua/plugins/devicons.lua

if not vim.g.vscode then
    return {
        {
            "ryanoasis/vim-devicons",
            config = function()
                -- 插件的配置选项
                vim.g.DevIconsEnableFoldersOpenClose = 1
            end,
        },
    }
else
    return {}
end

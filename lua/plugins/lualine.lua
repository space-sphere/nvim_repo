return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy", -- 懒加载，提高性能
        config = function()
            require("lualine").setup({
                options = {
                    theme = "gruvbox", -- 或者你喜欢的主题
                    icons_enabled = true, -- 启用图标
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename" },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
        -- 这里的条件判断：当 Neovim 运行在 VSCode 中时禁用 lualine
        cond = function()
            return not vim.g.vscode
        end,
    },
}

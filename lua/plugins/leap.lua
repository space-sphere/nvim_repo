-- return {
--     {
--         "ggandor/leap.nvim",
--         config = function()
--             -- 显式绑定 s 键
--             vim.keymap.set("n", "s", function()
--                 require("leap").leap({ target_windows = { vim.fn.win_getid() } })
--             end, { desc = "Leap jump" })
--
--             -- 可以绑定 S 键进行跨窗口跳转
--             vim.keymap.set("n", "S", function()
--                 require("leap").leap({
--                     target_windows = vim.tbl_filter(function(win)
--                         return win ~= vim.fn.win_getid()
--                     end, vim.api.nvim_tabpage_list_wins(0)),
--                 })
--             end, { desc = "Leap cross-window jump" })
--         end,
--     },
-- }

-- lazy.nvim 插件管理器
return {
    {
        "ggandor/leap.nvim",
        config = function()
            -- 加载 leap.nvim 的默认键映射
            require("leap").add_default_mappings()

            -- 如果你想手动绑定按键，可以使用如下自定义配置
            vim.keymap.set("n", "s", function()
                require("leap").leap({ target_windows = { vim.fn.win_getid() } })
            end, { desc = "Leap jump within window" })

            vim.keymap.set("n", "S", function()
                require("leap").leap({
                    target_windows = vim.tbl_filter(function(win)
                        return win ~= vim.fn.win_getid()
                    end, vim.api.nvim_tabpage_list_wins(0)),
                })
            end, { desc = "Leap cross-window jump" })
        end,
    },
}

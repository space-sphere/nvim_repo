if true then
    return {}
end

return {
    {
        "vscode-neovim/vscode-multi-cursor.nvim",
        event = "VeryLazy", -- 插件的延迟加载
        cond = not not vim.g.vscode,
        config = function()
            -- 插件的 setup 配置
            require("vscode-multi-cursor").setup({
                default_mappings = true,
                no_selection = false,
            })

            -- 键映射
            local cursors = require("vscode-multi-cursor")
            local k = vim.keymap.set

            -- 设置键映射
            k({ "n", "x" }, "mc", cursors.create_cursor, { expr = true, desc = "Create cursor" })
            -- k({ "n", "x" }, "mc", function()
            --     cursors.create_cursor()
            --     vim.api.nvim_feedkeys("L", "n", false)
            -- end, { expr = true, desc = "Create cursor and press L" })

            k({ "n" }, "mcc", cursors.cancel, { desc = "Cancel/Clear all cursors" })
            k({ "n", "x" }, "mi", cursors.start_left, { desc = "Start cursors on the left" })
            k({ "n", "x" }, "mI", cursors.start_left_edge, { desc = "Start cursors on the left edge" })
            k({ "n", "x" }, "ma", cursors.start_right, { desc = "Start cursors on the right" })
            k({ "n", "x" }, "mA", cursors.start_right_edge, { desc = "Start cursors on the right edge" })
            k({ "n" }, "[mc", cursors.prev_cursor, { desc = "Goto prev cursor" })
            k({ "n" }, "]mc", cursors.next_cursor, { desc = "Goto next cursor" })
            k({ "n" }, "mcs", cursors.flash_char, { desc = "Create cursor using flash" })
            k({ "n" }, "mcw", cursors.flash_word, { desc = "Create selection using flash" })
        end,
    },
}

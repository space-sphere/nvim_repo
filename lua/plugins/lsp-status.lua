return {
    {
        "nvim-lua/lsp-status.nvim",
        event = "LspAttach", -- 当 LSP 连接时加载
        config = function()
            local lsp_status = require("lsp-status")
            lsp_status.config({
                indicator_errors = "❌",
                indicator_warnings = "⚠️ ",
                indicator_info = "ℹ️ ",
                indicator_hint = "💡",
                indicator_ok = "✅",
            })
            lsp_status.register_progress() -- 注册进度显示
        end,
    },
}

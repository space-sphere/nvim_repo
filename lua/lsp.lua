local lsp_status = require("lsp-status")
lsp_status.register_progress()
lsp_status.config({
    indicator_errors = "❌",
    indicator_warnings = "⚠️ ",
    indicator_info = "ℹ️ ",
    indicator_hint = "💡",
    indicator_ok = "✅",
})

local cmp = require("completion")

local mix_attach = function(client)
    lsp_status.on_attach(client)
    cmp.on_attach(client)
end

require("lspconfig").clangd.setup({
    on_attach = mix_attach, -- 将这个 mix_attach 传递给 clangd
    capabilities = lsp_status.capabilities, -- 支持 lsp-status 的能力
})

require("lspconfig").clangd.setup({
    on_attach = mix_attach, -- 你的 on_attach 配置
    capabilities = lsp_status.capabilities, -- 支持 lsp-status 的能力
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/clangd" }, -- 使用 Mason 安装的 clangd
    args = {
        "--compile-commands-dir=.",
        "-I/Library/Developer/CommandLineTools/usr/include/c++/v1", -- macOS C++ 标准库路径
    },
})

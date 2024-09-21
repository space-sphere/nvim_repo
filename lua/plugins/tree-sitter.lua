return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- 自动更新 Tree-sitter 解析器
        event = { "BufReadPost", "BufNewFile" },
        opts = function()
            local config = {
                ensure_installed = { "lua", "python", "javascript", "html", "css", "c", "cpp" },
                highlight = {
                    enable = true, -- 启用语法高亮
                },
                indent = {
                    enable = true, -- 启用智能缩进
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            }

            -- 如果在 VSCode 环境下，可以根据需要禁用或修改某些功能
            if vim.g.vscode then
                config.highlight.enable = true -- 在 VSCode 中启用语法高亮
                -- 如果在 VSCode 环境下有特别想禁用的功能，可以在这里禁用
            end

            return config
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}

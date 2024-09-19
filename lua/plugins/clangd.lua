return {
    "neovim/nvim-lspconfig",
    config = function()
        require("lspconfig").clangd.setup({
            cmd = { "clangd", "--clang-tidy", "--compile-commands-dir=." },
            filetypes = { "c", "cpp", "objc", "objcpp" },
            root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
        })
    end,
}

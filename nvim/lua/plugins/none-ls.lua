return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,

                null_ls.builtins.formatting.clang_format,

                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.diagnostics.flake8,
                null_ls.builtins.diagnostics.mypy,

                null_ls.builtins.formatting.google_java_format,

                null_ls.builtins.diagnostics.phpcs,
                null_ls.builtins.diagnostics.phpstan,
                null_ls.builtins.formatting.phpcsfixer,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}

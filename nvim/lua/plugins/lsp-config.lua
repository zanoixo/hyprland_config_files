return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pylsp", "jdtls", "bashls", "clangd", "intelephense" },
            })
            vim.diagnostic.config({
                virtual_text = true,
                underline = true,
                update_in_insert = false,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {

                            disable = { "trailing-space" },
                        },
                    },
                },
                capabilities = capabilities,
            })

            lspconfig.pylsp.setup({
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            jedi_completion = {
                                include_params = true,
                            },
                        },
                    },
                },
            })

            lspconfig.jdtls.setup({
                capabilities = capabilities,
            })

            lspconfig.bashls.setup({
                capabilities = capabilities,
            })

            lspconfig.clangd.setup({
                capabilities.capabilities,
            })
            lspconfig.intelephense.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>g", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}

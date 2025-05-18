return {
    "stevearc/overseer.nvim",
    config = function()
        local overseer = require("overseer")
        overseer.setup({
            strategy = "toggleterm",
            open_on_start = true,
            open_on_exit = true,
        })
    
        -- Python
        overseer.register_template({
            name = "Run Python file",
            builder = function()
                return {
                    cmd = { "python3", vim.api.nvim_buf_get_name(0) },
                    components = { "default" },
                }
            end,
            condition = {
                filetype = { "python" },
            },
        })

        -- C
        overseer.register_template({
            name = "Compile and Run C file",
            builder = function()
                local file = vim.fn.expand("%:p")
                local exe = vim.fn.expand("%:p:r")
                return {
                    cmd = { "sh", "-c", "gcc " .. file .. " -o " .. exe .. " && " .. exe },
                    components = { "default" },
                }
            end,
            condition = {
                filetype = { "c" },
            },
        })

        -- Java
        overseer.register_template({
            name = "Compile and Run Java file",
            builder = function()
                local file = vim.fn.expand("%:t")
                local class = vim.fn.expand("%:t:r")
                local dir = vim.fn.expand("%:p:h")
                return {
                    cmd = { "sh", "-c", "javac " .. file .. " && java -cp " .. dir .. " " .. class },
                    components = { "default" },
                }
            end,
            condition = {
                filetype = { "java" },
            },
        })

        -- Keymap to run current file
        vim.keymap.set("n", "<leader>r", function()
            overseer.run_template()
        end, { desc = "Run current file with Overseer" })
    end,
}

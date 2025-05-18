return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {},
    config = function ()
        require("toggleterm").setup{}
        vim.keymap.set({"n", "v"}, "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
    end
}

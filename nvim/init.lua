local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvecho({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local timer = vim.loop.new_timer()

timer:start(
	1000,
	1000,
	vim.schedule_wrap(function()
		if vim.bo.modified and vim.api.nvim_get_mode().mode == "i" then
			vim.cmd("silent! write")
		end
	end)
)

require("vim-options")
require("lazy").setup("plugins")

vim.keymap.set({ "v", "n" }, "<leader>s", "<cmd>w<cr><esc>")
vim.keymap.set("n", "<leader>q", function()
	local ok, term = pcall(require, "toggleterm.terminal")
	if ok then
		for _, t in pairs(term.get_all()) do
			t:shutdown()
		end
	end

	vim.cmd("wqa")
end)

vim.keymap.set("v", "<leader>c", '"+y')
vim.keymap.set("v", "<space>x", '"+d')
vim.keymap.set("n", "<leader>v", '"+p')
vim.keymap.set("v", "<leader>v", "<C-r>+")

vim.keymap.set({ "n", "v" }, "<leader>z", "u")
vim.keymap.set({ "n", "v" }, "<leader>y", "<C-r>")

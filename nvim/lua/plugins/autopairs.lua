return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true, -- enable treesitter integration
			disable_filetype = { "TelescopePrompt", "vim" },
			fast_wrap = {}, -- optional fast wrap keys (empty for now)
		})
	end,
}

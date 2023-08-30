local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
	    opts = {
	        ensure_installed = {
				-- defaults
				"vim",
				"lua",

				-- data science
				"python",
				"r",

				-- terminal
				"bash",
				"awk",

				-- visualization
				"markdown",

				-- low level
				"c"
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- defaults
					--[[
					already installed
					--]]

				-- data science
				"pyright",
				"r-languageserver",

				-- terminal
				"bash-language-server",
				"awk-language-server",

				-- visualization
					--[[
					don't really feel like 
					I need an LSP to edit 
					a markdown file
					--]]
				-- "marksman" 	

				-- low level
				"clangd"
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end,
	},
}
return plugins

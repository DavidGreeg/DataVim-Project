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
			-- The following code was added here instead of in the mappings file, because even tho the following 
			-- map format kinda worked, it didn't totally perform as expected:
			-- ["<leader>ss"] = {"<cmd> lua require('nvim-treesitter.incremental_selection').init_selection() <Enter>"},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>si",
					scope_incremental = false,
					node_decremental = "<leader>sd",
				}
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
				--"awk-language-server",

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
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto", "markdown", "Rmd" },
		dev = false,
		dependencies = {
			"jmbuhr/otter.nvim",
			dev = false,
		},
		opts = {
			debug = false,
			closePreviewOnExit = true,
			lspFeatures = {
				enabled = true,
				languages = { 'r', 'python', 'bash' },
				chunks = 'curly', -- 'curly' or 'all'
				diagnostics = {
					enabled = true,
					triggers = { "BufWritePost" }
				},
				completion = {
					enabled = true,
				},
			},
			keymap = {
				hover = 'K',
				definition = 'gd',
				type_definition = 'gD',
				rename = '<leader>ra',
				format = '<leader>fm',
				references = 'gr',
				document_symbols = 'gS',
			},
		}
	}
}
return plugins

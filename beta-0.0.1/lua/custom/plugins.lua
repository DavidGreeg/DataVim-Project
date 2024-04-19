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
				"lua-language-server",
				--"vim-language-server", (doesnt feel necesary right now)

				-- data science
				"pyright",
				"r-languageserver",

				-- terminal
				"bash-language-server",
				--"awk-language-server", (installed via npm)

				-- visualization
				"marksman",

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
	},
	{
		"jmbuhr/otter.nvim",
		opts = {},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies =  { "jmbuhr/otter.nvim" },
		opts = function(_,opts)
			--@param opts cmp.ConfigSchema 
			local cmp = require("cmp")
			opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {{ name = "otter" }} ))
		end,
	},
	{
		"jpalardy/vim-slime",
		ft = { "quarto", "markdown", "Rmd", "lua" },
		init = function()
			vim.b['quarto_is_' .. 'python' .. '_chunk'] = false
			Quarto_is_in_python_chunk = function()
			  require 'otter.tools.functions'.is_otter_language_context('python')
			end

			vim.cmd([[
			let g:slime_dispatch_ipython_pause = 100
			function SlimeOverride_EscapeText_quarto(text)
			call v:lua.Quarto_is_in_python_chunk()
			if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
			return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
			else
			return a:text
			end
			endfunction
			]])

			-- slime, neovim terminal
			vim.g.slime_target = "neovim"
			vim.g.slime_python_ipython = 1
			vim.b.slime_cell_delimiter = "```"
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			override = {
				R = {
					icon = "󰟔",
					color = "#358a5b",
					cterm_color = "29",
					name = "R",
				},
				Rmd = {
					icon = "",
					color = "#43b8a5",
					cterm_color = "74",
					name = "Rmd",
				},
				ipynb = {
					icon = "󰌠",
					color = "#5583b8",
					cterm_color = "74",
					name = "ipynb",
				},
				csv = {
					icon = "",
					color = "#a17d54",
					cterm_color = "74",
					name = "CSV",
				},
			},
			override_by_extension = {
				["qmd"] = {
					icon = "",
					color = "#8e31bf",
					cterm_color = "90",
					name = "Quarto",
				},
				["tsv"] = {
					icon = "",
					color = "#a17f24",
					cterm_color = "90",
					name = "TSV",
				},
			}
		}
		-- require("nvim-web-devicons").set_icon{
		-- 	R = {
		-- 		icon = "󰟔",
		-- 		color = "#358a5b",
		-- 		cterm_color = "29",
		-- 		name = "R",
		-- 	},
		-- 	Rmd = {
		-- 		icon = "",
		-- 		color = "#519aba",
		-- 		cterm_color = "74",
		-- 		name = "Rmd",
		-- 	}
		-- }
	}
}
return plugins

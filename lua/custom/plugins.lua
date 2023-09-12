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
		"jpalardy/vim-slime",
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

			-- local function mark_terminal()
			-- 	vim.g.slime_last_channel = vim.b.terminal_job_id
			-- 	vim.print(vim.g.slime_last_channel)
			-- end
			--
			-- local function set_terminal()
			-- 	vim.b.slime_config = { jobid = vim.g.slime_last_channel }
			-- end

			vim.b.slime_cell_delimiter = "```"
		end
	}
}
return plugins

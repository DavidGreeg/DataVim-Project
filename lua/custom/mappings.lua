local M = {}
local opt = vim.opt
-- local map = vim.api.nvim_set_keymap
-- local map_opts = { noremap = true, silent = true}
-- local tsitter = require("plugins.configs.treesitter").options()

-- this opt enables visual mode whenever pressing shift:
opt.keymodel = "startsel,stopsel"


-- to disable keymaps
M.disabled = {
	n = {
		["<A-t>"] = "",
		["<A-i>"] = "", -- I don't really use floating terminals
		["<C-s>"] = "",
		["<C-n>"] = "",
		-- ["<C-c>"] = "",
		-- ["<C-l>"] = "",
		-- ["<C-k>"] = "",
		-- ["<C-j>"] = "",
		-- ["<C-h>"] = "",
		["<leader>n"] = "",
		["<leader>f"] = "",
		["<leader>q"] = "",
		["<leader>e"] = "",
		["<leader>v"] = "", -- might be useful later, core mapping does: require("nvterm.terminal").new "horizontal"
		["<leader>h"] = "", -- might be useful later, core mapping does: require("nvterm.terminal").new "vertical"
		["<leader>rn"] = "",
		["<leader>tm"] = "",
		["<leader>ts"] = "",
		-- ["<leader>tm1"] = "",
		-- ["<leader>tm2"] = "",
		-- ["<leader>tm3"] = "",
		-- ["<leader>ts1"] = "",
		-- ["<leader>ts2"] = "",
		-- ["<leader>ts3"] = "",
		["<leader>tb"] = "",
		["<leader>tr"] = "",
		["<leader>tp"] = "",
		["<leader>qa"] = "",
		["<leader>qsa"] = "",
		["<leader>qsb"] = "",
		["<leader>qsc"] = "",
		["<leader>/"] = "",
	},
	-- i = {
	-- 	["<A-n>"] = "",
	-- 	["<A-v>"] = "",
	-- },
	v = {
		-- ["<leader>si"] = "",
		["<leader>/"] = "",
	},
	t = {
		["<C-x>"] = "",
  },

}


-- my custom mappings
M.general = {
	n = {
		["<leader>e"] = {"<cmd> NvimTreeToggle <enter>", "Explore File-Tree"},
		["<A-w>"] = {'<cmd> w <enter>', "Save File"},
		["<A-q>"] = {'<cmd> q <enter>', "Quit/Exit"},
		["<C-c>"] = {'<C-w> c <enter>', "Close window"},
	},
	i = {
	 	["<A-w>"] = {'<cmd> w <enter>', "Save File"},
		["<A-u>"] = {'<cmd> u <enter>', "Undo"},
		["<A-r>"] = {'<C-r>', "Redo"},
		["<A-q>"] = {'<esc>', "Quit to Normal Mode"},
		["<A-p>"] = {'<esc>pi', "Paste"},
	},
	-- v = {
	-- 	["<A-x>"] = {, },
	-- 	["<A-c>"] = {, },
	-- },
	c = {
		["<C-c>"] = {"<c-\\>e \"lua require('telescope.builtin').command_history "
		.. '{ default_text = [=[" . escape(getcmdline(), \'"\') . "]=] }"<enter><enter>', "Fuzzy Command Search"},
		["<C-k>"] = {"<cmd> Telescope keymaps <enter>", "Fuzzy Keymap Search"},
		["<C-v>"] = {"<cmd> Telescope lsp_document_symbols <enter>", "Fuzzy Variable Search"}
	},
	t = {
		["<A-q>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
	},
}

M.windows = {
	n = {
		["<C-l>"] = {'<C-w>l', "Move window Right"},
		["<C-h>"] = {'<C-w>h', "Move window Left"},
		["<C-k>"] = {'<C-w>k', "Move window Up"},
		["<C-j>"] = {'<C-w>j', "Move window Down"},

		-- ["<A-c>"] = {':lua require("nvchad.tabufline").close_buffer()<enter><cmd>wincmd c<enter>', "Close window"},
		["<A-c>"] = {'<cmd>wincmd c<enter>', "Close window"},
	}
}

-- This following code seems like cheating, the key maps were defined in 'custom.plugins'
-- however, I could't find a work around the recommended key definition (inside the plugin opts)
M.incremental_selection = {
	n = {
		["<leader>ss"] = {"<leader>ss", "Initiate Selection"},
	},
	x = {
		["<leader>si"] = {"<leader>si", "Increment Selection"},
		["<leader>sd"] = {"<leader>sd", "Decrement Selection"},
	}
}

M.repl = {
	n = {
		["<leader>hb"] = {':split term://$SHELL<cr>', 'New terminal' },
		-- ["<leader>hb"] = {
		-- 	function()
		-- 		local nvterm = require "nvterm.terminal"
		-- 		nvterm.new "horizontal"
		-- 	end, "New Bash terminal"},
		["<leader>hr"] = {':split term://R<cr>', 'New R terminal' },
		-- ["<leader>hr"] = {
		-- 	function()
		-- 		local nvterm = require "nvterm.terminal"
		-- 		nvterm.send("R", "horizontal")
		-- 		nvterm.toggle "horizontal"
		-- 		nvterm.toggle "horizontal"
		-- 	end, "New Bash terminal"},
		["<leader>hp"] = {':split term://ipython<cr>', 'New iPython terminal' },
		-- ["<leader>hp"] = {
		-- 	function()
		-- 		local nvterm = require "nvterm.terminal"
		-- 		nvterm.send("ipython", "horizontal")
		-- 		nvterm.toggle "horizontal"
		-- 		nvterm.toggle "horizontal"
		-- 	end, "New Bash terminal"},

		["<leader>vb"] = {':vsplit term://$SHELL<cr>', 'New terminal' },
		["<leader>vr"] = {':vsplit term://R<cr>', 'New R terminal' },
		["<leader>vp"] = {':vsplit term://ipython<cr>', 'New iPython terminal' },

		-- ["<leader>ta"] = {
		-- 	function()
		-- 		require("nvterm.terminal").toggle_all_terms()
		-- 	end, "Toggle All Terminals"},

		["<leader>ta"] = {":lua require('nvterm.terminal').toggle_all_terms()<cr>", "Toggle All Terminals"},

		["<leader>cb"] = {'o```{bash}<cr>```<esc>O', "Open Bash Code Chunk" },
		["<leader>cr"] = {'o```{r}<cr>```<esc>O', "Open R Code Chunk" },
		["<leader>cp"] = {'o```{python}<cr>```<esc>O', "Open Python Code Chunk" },

		["<A-t>s"] = {":SlimeSend<enter>","Send to Terminal current Code Chunk"},
		["<A-t>c"] = {":<c-u>call slime#send_cell()<cr>","Send to Terminal current Cell"},

		-- ["<leader>tm"] = {
		-- 	function()
		-- 		vim.g.slime_last_channel = vim.b.terminal_job_id
		-- 		print("Terminal with ID " .. vim.g.slime_last_channel .. " is marked")
		-- 	end, "Mark Terminal"},
		--
		-- ["<leader>ts"] = {
		-- 	function()
		-- 		vim.b.slime_config = { jobid = vim.g.slime_last_channel }
		-- 		print("Terminal with ID " .. vim.g.slime_last_channel .. " is set")
		-- 	end, "Set Terminal"},

		["<leader>tm1"] = {
			function()
				vim.g.slime_channel1 = vim.b.terminal_job_id
				print("Marked: Terminal 1 with ID " .. vim.g.slime_channel1)
			end, "Mark Terminal 1"},
		["<leader>tm2"] = {
			function()
				vim.g.slime_channel2 = vim.b.terminal_job_id
				print("Marked: Terminal 2 with ID " .. vim.g.slime_channel2)
			end, "Mark Terminal 2"},
		["<leader>tm3"] = {
			function()
				vim.g.slime_channel3 = vim.b.terminal_job_id
				print("Marked: Terminal 3 with ID " .. vim.g.slime_channel3)
			end, "Mark Terminal 3"},


		["<leader>ts1"] = {
			function()
				vim.b.slime_config = { jobid = vim.g.slime_channel1 }
				print("Set to: Terminal 1 with ID " .. vim.g.slime_channel1)
			end, "Set Terminal 1"},
		["<leader>ts2"] = {
			function()
				vim.b.slime_config = { jobid = vim.g.slime_channel2 }
				print("Set to: Terminal 2 with ID " .. vim.g.slime_channel2)
			end, "Set Terminal 2"},
		["<leader>ts3"] = {
			function()
				vim.b.slime_config = { jobid = vim.g.slime_channel3 }
				print("Set to: Terminal 3 with ID " .. vim.g.slime_channel3)
			end, "Set Terminal 3"},
	},
	v = {
		["<A-t>s"] = {":SlimeSend<enter>","Send to Terminal current Code Chunk"},
	}
}

M.lspconfig = {
	plugin = true,
	n = {
		["<leader>df"] = {
			function()
				vim.diagnostic.open_float { border = "rounded" }
			end,
			"Floating Diagnostic",
		},
		["<leader>dl"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"List Diagnostics",
		},
	}
}

M.quarto = {
	n = {
		["<leader>qp"] = {":QuartoPreview<enter>","Quarto Preview"},
		["<leader>qc"] = {":QuartoClosePreview<enter>","Quarto Close Preview"},
		-- ["<leader>qh"] = {":QuartoHelp","Quarto Help"},
		["<leader>sc"] = {":QuartoSend<enter>","Quarto Send Cell"},
		["<leader>sa"] = {":QuartoSendAll<enter>","Quarto Send All Cells"},
		["<leader>sp"] = {":QuartoSendAbove<enter>","Quarto Send all Previous Cells"},
		["<leader>sn"] = {":QuartoSendBelow<enter>","Quarto Send all Next Cells"},
	}
}

-- my custom way of commenting
M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>co"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle Comment",
    },
  },

  v = {
    ["<leader>co"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      "Toggle Comment",
    },
  },
}

return M

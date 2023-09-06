local m = {}
local opt = vim.opt
-- local map = vim.api.nvim_set_keymap
-- local map_opts = { noremap = true, silent = true}
-- local tsitter = require("plugins.configs.treesitter").options()

-- this opt enables visual mode whenever pressing shift:
opt.keymodel = "startsel,stopsel"

-- to disable keymaps
-- m.disabled = {
-- 	-- n = {
-- 	-- 	["<C-s>"] = "",
-- 	-- 	["<leader>ss"] = "",
-- 	-- },
-- 	-- i = {
-- 	-- 	["<A-n>"] = "",
-- 	-- 	["<A-v>"] = "",
-- 	-- },
-- 	-- v = {
-- 	--  ["<leader>si"] = "",
-- 	-- 	["<leader>/"] = "",
-- 	-- }
-- }


-- my custom mappings
m.customized = {
	n = {
		["<leader>e"] = {"<cmd> NvimTreeToggle <enter>", "Explore File-Tree"},
	},
	i = {
	 	["<A-w>"] = {'<cmd> w <enter>', "Save File"},
		["<A-p>"] = {'<esc> pi', "Paste"},
		["<A-q>"] = {'<esc>', "Quit to Normal Mode"},
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
	}
}

-- This following code seems like cheating, the key maps were defined in 'custom.plugins'
-- however, I could't find a work around the recommended key definition (inside the plugin opts)
m.incremental_selection = {
	n = {
		["<leader>ss"] = {"<leader>ss", "Initiate Selection"},
	},
	x = {
		["<leader>si"] = {"<leader>si", "Increment Selection"},
		["<leader>sd"] = {"<leader>sd", "Decrement Selection"},
	}
}


-- my custom way of commenting
m.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>co"] = {
      function()
        require("comment.api").toggle.linewise.current()
      end,
      "Toggle Comment",
    },
  },

  v = {
    ["<leader>co"] = {
      "<esc><cmd>lua require('comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      "Toggle Comment",
    },
  },
}

return m

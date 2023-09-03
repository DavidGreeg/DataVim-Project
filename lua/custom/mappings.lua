local M = {}
local opt = vim.opt
local map = vim.api.nvim_set_keymap

-- This opt enables visual mode whenever pressing Shift:
opt.keymodel = "startsel,stopsel"

map('i', 'cs-S', [[<cmd> w <Enter>]], {noremap = true})

-- To disable keymaps
M.disabled = {
	n = {
		["<C-s>"] = "",
		-- ["<leader>/"] = "",
	},
	-- i = {
	-- 	["<C-s>"] = "",
	-- },
	-- v = {
	-- 	-- ["<C-s>"] = "",
	-- 	["<leader>/"] = "",
	-- }
}


-- My custom mappings
M.davidfm = {
	x = {
		["<M-x>"] = {'<Esc> "+d i', "Cut Selection"},
		["<M-c>"] = {'<Esc> "+y i', "Copy Selection"},
	},
	n = {
		["<leader>e"] = {"<cmd> NvimTreeToggle <Enter>", "Toggle Tree"},
	},
	i = {
	 	["<C-S-s>"] = {'<cmd> w <Enter>', "Save File"},
		["<C-S-v>"] = {'<Esc> p i', "Paste"},
	},
	-- v = {},
	c = {
		["<C-c>"] = {"<C-\\>e \"lua require('telescope.builtin').command_history "
		.. '{ default_text = [=[" . escape(getcmdline(), \'"\') . "]=] }"<Enter><Enter>', "Fuzzy Command Search"},
		["<C-k>"] = {"<cmd> Telescope keymaps <Enter>", "Fuzzy Keymap Search"},
		["<C-v>"] = {"<cmd> Telescope lsp_document_symbols <Enter>", "Fuzzy Variable Search"}
	}
}

-- My custom way of commenting
M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>co"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>co"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

return M

local M = {}
local opt = vim.opt
-- This opt enables visual mode whenever pressing Shift:
opt.keymodel = "startsel,stopsel"

-- To disable keymaps
M.disabled = {
	n = {
		-- ["<C-n>"] = "",
		["<leader>/"] = "",
	},
	v = {
		-- ["<C-s>"] = "",
		["<leader>/"] = "",
	}
}

-- My custom mappings
M.davidfm = {
	n = {
		["<leader>e"] = {"<cmd> NvimtreeToggle <Enter>", "Toggle Tree"},
	},
	i = {
		["<C-s>"] = {"<cmd> w <Enter>", "Save File"}
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

local M = {}
local opt = vim.opt

--To disable default keymaps
M.disabled = {
	c = {
		--["<C-s>"] = "",
		--["<leader>e"] = ""
	}
}

opt.keymodel = "startsel,stopsel"

-- My custom mappings
M.davidfm = {
	-- n = {},
	i = {
		["<C-s>"] = {"<cmd> w <Enter>", "Save File"}
	},
	-- v = {},
	c = {
		["<C-s>"] = {"<C-\\>e \"lua require('telescope.builtin').command_history "
    .. '{ default_text = [=[" . escape(getcmdline(), \'"\') . "]=] }"<CR><CR>', "Fuzzy Command Search$"},
		["<C-k>"] = {"<cmd> Telescope keymaps <Enter>"}
	}
}

return M

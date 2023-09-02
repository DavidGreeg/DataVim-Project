local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

-- data science
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"python"},
})
lspconfig.r_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"r","rmd"},
})

-- terminal
lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"sh"},
})
lspconfig.awk_ls.setup({
-- this one couln't be installed via Mason, but directly running 
-- 'sudo npm install -g "awk-language-server"' in terminal
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"awk"},
})

-- low level
lspconfig.clangd.setup({
	on_attach = function (client, bufnr)
		client.server_capabilities.signatureHelpProvider = false
		on_attach(client, bufnr)
	end,
	capabilities = capabilities,
})

vim.diagnostic.config({ virtual_text = false })

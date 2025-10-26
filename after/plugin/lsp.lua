local lsp = require("lsp-zero")

-- 1. Setup Mason first
require('mason').setup()

-- 2. Setup Mason-Lspconfig (the bridge)
require('mason-lspconfig').setup({
    -- This key is correct for ensuring installation via mason-lspconfig
	automatic_installation = true,
	automatic_enable = false,
    ensure_installed = { 
        "pylsp", 
		"clangd",
    },
})
local lspconfig = require('lspconfig')
local on_attach = function(...)
end

lspconfig.pylsp.setup({ on_attach = on_attach})

-- The rest of your lspconfig setup goes here...
lsp.setup()

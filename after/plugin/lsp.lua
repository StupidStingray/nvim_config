-- lua/lsp/init.lua

local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')
local servers = { 'pylsp', 'clangd', 'lua_ls' } -- Your target LSPs

-- Function executed when a server successfully attaches to a buffer
local on_attach = function(client, bufnr)
    -- Options for keymaps
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Set keymaps for common LSP features
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)      -- Go to definition
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)           -- Show documentation hover
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts) -- View diagnostics
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)  -- Rename

    -- Enable dynamic code folding
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'v:lua.vim.lsp.buf.folding_range()'
end

-- Initialize Mason and Mason-Lspconfig
require('mason').setup()

mason_lspconfig.setup({
    ensure_installed = servers, -- Ensures the specified LSPs are installed
    automatic_installation = true,
})

-- Loop through all installed servers and set them up using lspconfig
-- In the same lua/lsp/init.lua file

local cmp = require('cmp')
local luasnip = require('luasnip')

-- Configure nvim-cmp
cmp.setup({
    -- Set the snippets engine
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    
    -- Configure key mappings
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Select the first item or accept
        
        -- Snippet navigation
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    
    -- Define completion sources
    sources = {
        { name = 'nvim_lsp' },  -- LSP server completions
        { name = 'luasnip' },   -- Snippet completions
        { name = 'buffer' },    -- Words from the current buffer
    },
})

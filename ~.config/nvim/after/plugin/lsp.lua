-- Mason-lspconfig setup
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",         -- Lua
        "ts_ls",          -- Typescript/JavaScript
        "eslint",         -- eslint
        "gopls",          -- Go
        "html",           -- html
        "cssls",          -- css
        "jsonls",         -- Json
        "pyright",        -- Python
        "rust_analyzer",  -- Rust
        "clangd",         -- C/C++
        "jdtls",          -- Java
        "bashls",         -- Bash
        "yamlls",         -- YAML
        "dockerls",       -- Docker
        "sqlls",          -- SQL
        "tailwindcss",    -- Tailwind CSS
        "emmet_ls",       -- Emmet

    },
    automatic_installation = true,
})

-- LSP configuration
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Add completion capabilities
local capabilities = cmp_nvim_lsp.default_capabilities()

-- LSP keymaps (add after capabilities)
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

-- Configure individual language servers
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})
lspconfig.ts_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.eslint.setup({
    capabilities = capabilities,
})

lspconfig.gopls.setup({
    capabilities = capabilities,
})

lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach
})


lspconfig.jdtls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})


lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.dockerls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.yamlls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.sqlls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.tailwindcss.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})


local null_ls = require("null-ls")

-- Helper function to safely add sources
local function safe_builtin(builtin_path)
  local ok, builtin = pcall(function()
    local parts = vim.split(builtin_path, ".")
    local current = null_ls.builtins
    for _, part in ipairs(parts) do
      current = current[part]
    end
    return current
  end)
  return ok and builtin or nil
end

local sources = {}

-- Add available sources
local potential_sources = {
  -- JavaScript/TypeScript
  "formatting.prettier",
  "diagnostics.eslint",
  "diagnostics.eslint_d", -- Alternative
  "code_actions.eslint",
  "code_actions.eslint_d", -- Alternative
  
  -- Python
  "formatting.black",
  "formatting.isort",
  "diagnostics.flake8",
  
  -- Go
  "formatting.gofmt",
  "formatting.goimports",
  "diagnostics.golangci_lint",
  
  -- Lua
  "formatting.stylua",
  
  -- Shell
  "formatting.shfmt",
  "diagnostics.shellcheck",
}

for _, source_path in ipairs(potential_sources) do
  local source = safe_builtin(source_path)
  if source then
    table.insert(sources, source)
  end
end

null_ls.setup({
  sources = sources,
  
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

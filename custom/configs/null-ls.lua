local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- Lua
  b.formatting.stylua,

  --bash
  b.diagnostics.shellcheck,
  b.formatting.shellharden,

  --python
  b.diagnostics.ruff.with(
    {
      extra_args = { "--ignore=E501" },
    }
  ),
  b.diagnostics.mypy.with(
    {
      extra_args = { "--ignore-missing-imports"}
    }
  ),
  b.formatting.black,
  b.formatting.isort,

  --terraform
  b.formatting.terraform_fmt,

  --yaml
  b.diagnostics.yamllint,

  --other
  b.diagnostics.codespell,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}

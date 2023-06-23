local present, null_ls = pcall(require, "null-ls")

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
}

local present, null_ls = pcall(require, "null-ls")
-- local autoformat = vim.api.nvim_create_augroup("LspFormatting", {
--   { "BufWritePre", "*", "lua vim.lsp.buf.formatting_sync(nil, 1000)" },
-- })

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python stuff
  -- b.diagnostics.mypy.with {
  --   django_settings_module = "the_profiler.settings",
  --   extra_args = { "--ignore-missing-imports" },
  --   sources = { "pyright" },
  --   diagnostics_format = "#{m} [#{c}]"
  -- },
  -- b.diagnostics.mypy,
  b.diagnostics.ruff,
  -- b.diagnostics.flake8,
  b.formatting.black,

  -- Django stuff
  b.formatting.djlint,
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- autoformatting stuff
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- local pid = vim.fn.getpid()

-- if you just want default config for the servers then put them in a table
local servers = {
  -- "html",
  "cssls",
  "tsserver",
  "clangd",
  "dockerls",
  "docker_compose_language_service",
  "terraformls",
  "pylsp",
  "csharp_ls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local pid = vim.fn.getpid()

lspconfig.omnisharp.setup {
  cmd = { "omnisharp-mono", "--languageserver", "--hostPID", tostring(pid) },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "cs", "cshtml", "razor" },
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    html = {
      suggest = {
        fromBuffer = true,
        fromNodeModules = true,
      },
    },
  },
  filetypes = {
    "html",
    "cshtml",
    "razor",
    "htmldjango",
  },
}

lspconfig.emmet_language_server.setup {
  filetypes = {
    "css",
    "eruby",
    "html",
    "htmldjango",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
    "cshtml",
    "razor",
  },
  init_options = {
    --- @type table<string, any> https://docs.emmet.io/customization/preferences/
    preferences = {},
    --- @type "always" | "never" defaults to `"always"`
    showexpandedabbreviation = "always",
    --- @type boolean defaults to `true`
    showabbreviationsuggestions = true,
    --- @type boolean defaults to `false`
    showsuggestionsassnippets = false,
    --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
    syntaxprofiles = {},
    --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
    variables = {},
    --- @type string[]
    excludelanguages = {},
  },
}

-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pyright = {
--       disableLanguageServices = false,
--       disableOrganizeImports = false,
--       useLibraryCodeForTypes = true,
--       reportMissingModuleSource = "none",
--       reportMissingImports = "none",
--       reportUndefinedVariable = "none",
--       reportUnusedVariable = "none",
--       reportUnusedFunction = "none",
--       reportUnusedClass = "none",
--     },
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         diagnosticMode = "workspace",
--         -- diagnosticMode = "openFilesOnly",
--         typeCheckingMode = "off",
--         useLibraryCodeForTypes = true,
--       },
--     },
--   },
-- }

require("nvim-lsp-installer").setup {
  automatic_installation = true,
}

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local on_attach = require("user.lsp.handlers").on_attach
local capabilities = require("user.lsp.handlers").capabilities

-- sumneko_lua
local sumneko_lua_opts = require "user.lsp.settings.sumneko_lua"
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = sumneko_lua_opts.settings,
}

-- jsonls
local jsonls_opts = require "user.lsp.settings.jsonls"
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = jsonls_opts.settings,
  setup = jsonls_opts.setup,
}

-- pyright
local pyright_opts = require "user.lsp.settings.pyright"
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = pyright_opts.settings,
}

-- solang
-- local solang_opts = require "user.lsp.settings.solang"
-- lspconfig.solang.setup {
  -- opts = vim.tbl_deep_extend("force", solang_opts, g_opts)
-- }

-- emmet_ls
local emmet_ls_opts = require "user.lsp.settings.emmet_ls"
lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = emmet_ls_opts.cmd,
  filetype = emmet_ls_opts.filetype,
}

-- solc
-- local solc_opts = require "user.lsp.settings.solc"
-- lspconfig.solc.setup {
  -- opts = vim.tbl_deep_extend("force", solc_opts, g_opts)
-- }

-- gopls
local gopls_opts = require "user.lsp.settings.gopls"
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = gopls_opts.cmd,
}

require "user.lsp.lsp-signature"
-- require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

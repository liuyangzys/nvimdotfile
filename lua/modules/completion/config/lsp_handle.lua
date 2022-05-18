local M = {}

local keymap = require('keymap.init')

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

end

local function lsp_keymaps(bufnr)
  keymap.lsp_on_attach(bufnr)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  -- lsp_highlight_document(client)

  require("lsp_signature").on_attach(
    { use_lspsaga = false, floating_window = false },
    bufnr)
  require("aerial").on_attach(client)
  require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.cmd([[packadd cmp-nvim-lsp]])
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M

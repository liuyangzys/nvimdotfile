local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lsp_installer_ok then
  vim.notify("nvim-lsp-installer not found!")
  return
end

local lspconfig = require("lspconfig")
local lsp_handler = require("modules.completion.config.lsp_handle")


lsp_installer.setup({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

lsp_handler.setup()


-- 遍历所有的 lsp 并进行配置
local servers = lsp_installer.get_installed_servers()
for _, server in pairs(servers) do
  local opts = {
    on_attach = lsp_handler.on_attach,
    capabilities = lsp_handler.capabilities,
  }

  local enhance_server_opts = require("modules.completion.config.lsp_enhance")
  if enhance_server_opts[server.name] then
    enhance_server_opts[server.name](opts)
  end

  lspconfig[server.name].setup(opts)
end

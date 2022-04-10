local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not lsp_installer_ok then
	vim.notify("nvim-lsp-installer not found!")
	return
end

vim.cmd([[packadd cmp-nvim-lsp]])

local function custom_attach(client, buffnr)
	require("lsp_signature").on_attach({
		bind = true,
		use_lspsaga = false,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hi_parameter = "Search",
		handler_opts = { "double" },
	})
	require("aerial").on_attach(client)
	require("keymap").lsp_on_attach(client, buffnr)
end

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

lsp_installer.on_server_ready(function(server)
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	local opts = {
		capabilities = capabilities,
		flags = { debounce_text_changes = 500 },
		on_attach = custom_attach,
	}
	local enhance_server_opts = require("modules.completion.config.lsp_enhance")
	if enhance_server_opts[server.name] then
		enhance_server_opts[server.name](opts)
	end

	server:setup(opts)
end)

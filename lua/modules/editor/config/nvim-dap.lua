local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	vim.notify("nvim-dap not found!")
	return
end

local global = require("core.global")

-- set keymaps for dap
require("keymap").dap_on_attach()

dap.adapters.python = {
	type = "executable",
	command = "python",
	args = { "-m", "debugpy.adapter" },
}

dap.adapters.cortex_debug = {
	type = "executable",
	command = "node",
	args = { global.home .. "/.vscode/extensions/marus25.cortex-debug-1.4.4/dist/debugadapter.js" },
	options = { detached = false },
}

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = global.home .. "/.vscode/extensions/ms-vscode.cpptools-1.9.7/debugAdapters/bin/OpenDebugAD7",
	options = { detached = false },
}

dap.configurations.python = {}
dap.configurations.c = {}
dap.configurations.cpp = {}

-- load from json file
local load_js = {
	cppdbg = { "c", "cpp" },
	python = { "python" },
	cortex_debug = { "c", "cpp" },
}
require("dap.ext.vscode").load_launchjs(nil, load_js)

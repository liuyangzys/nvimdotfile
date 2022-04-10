local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
	vim.notify("nvim-dap not found!")
	return
end

-- set keymaps for dap
require("keymap").dap_on_attach()

dap.adapters.python = {
	type = "executable",
	command = "python",
	args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {}

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	-- command = os.getenv("HOME") .. "/.vscode/extensions/ms-vscode.cpptools-1.9.7/debugAdapters/bin/OpenDebugAD7"
	command = "C:/Users/liuya/.vscode/extensions/ms-vscode.cpptools-1.9.7/debugAdapters/bin/OpenDebugAD7",
}
dap.configurations.c = {}
dap.configurations.cpp = {}

-- load from json file
require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp" }, python = { "python" } })

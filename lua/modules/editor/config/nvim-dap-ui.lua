vim.cmd([[packadd nvim-dap]])
vim.cmd([[packadd nvim-dap-virtual-text]])

local dap = require("dap")
local dapui = require("dapui")

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
  vim.api.nvim_command("DapVirtualTextDisable")
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
  vim.api.nvim_command("DapVirtualTextDisable")
end
dap.listeners.before.disconnect["dapui_config"] = function()
  dapui.close()
  vim.api.nvim_command("DapVirtualTextDisable")
end
dap.listeners.after.event_initialized["dapui"] = function()
  dapui.open()
  vim.api.nvim_command("DapVirtualTextEnable")
end
-- dap.listeners.after.event_terminated["dapui"] = function()
--   dapui.close()
-- end
-- dap.listeners.after.event_exited["dapui"] = function()
--   dapui.close()
-- end

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  -- sidebar = {
  -- 	elements = {
  -- 		-- Provide as ID strings or tables with "id" and "size" keys
  -- 		{
  -- 			id = "scopes",
  -- 			size = 0.45, -- Can be float or integer > 1
  -- 		},
  -- 		{ id = "watches", size = 0.35 },
  -- 		{ id = "stacks", size = 0.15 },
  -- 		{ id = "breakpoints", size = 0.15 },
  -- 	},
  -- 	size = 40,
  -- 	position = "left",
  -- },
  tray = { elements = { "repl" }, size = 5, position = "bottom" },
  floating = {
    max_height = nil,
    max_width = nil,
    mappings = { close = { "q", "<Esc>" } },
  },
  windows = { indent = 1 },
})

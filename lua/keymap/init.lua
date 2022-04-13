local M = {}

local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymap.config")

-- default map
local def_map = {}

local plug_map = {
	-- Bufferline
	-- ["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
	["n|<A-j>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
	["n|<A-k>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
	-- ["n|<A-S-j>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
	-- ["n|<A-S-k>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent(),
	-- ["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap(),
	-- ["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap(),
	["n|<A-1>"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
	["n|<A-2>"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
	["n|<A-3>"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
	["n|<A-4>"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
	["n|<A-5>"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
	["n|<A-6>"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
	["n|<A-7>"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
	["n|<A-8>"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
	["n|<A-9>"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
	-- fugitive
	-- ["n|<Leader>G"] = map_cu("Git"):with_noremap():with_silent(),
	-- ["n|gps"] = map_cr("G push"):with_noremap():with_silent(),
	-- ["n|gpl"] = map_cr("G pull"):with_noremap():with_silent(),
	-- Plugin trouble
	-- ["n|gt"] = map_cr("TroubleToggle"):with_noremap():with_silent(),
	-- ["n|gR"] = map_cr("TroubleToggle lsp_references"):with_noremap():with_silent(),
	-- ["n|<leader>cd"] = map_cr("TroubleToggle lsp_document_diagnostics"):with_noremap():with_silent(),
	-- ["n|<leader>cw"] = map_cr("TroubleToggle lsp_workspace_diagnostics"):with_noremap():with_silent(),
	-- ["n|<leader>cq"] = map_cr("TroubleToggle quickfix"):with_noremap():with_silent(),
	-- ["n|<leader>cl"] = map_cr("TroubleToggle loclist"):with_noremap():with_silent(),
	-- Plugin nvim-tree
	["n|<Leader>nt"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
	["n|<Leader>nf"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
	["n|<Leader>nr"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent(),
	-- Plugin Aerial
	["n|<A-t>"] = map_cr("AerialToggle! right"):with_noremap():with_silent(),
	-- Plugin Telescope
	-- ["n|<Leader>fp"] = map_cu("lua require('telescope').extensions.project.project{}"):with_noremap():with_silent(),
	-- ["n|<Leader>fr"] = map_cu("lua require('telescope').extensions.frecency.frecency{}"):with_noremap():with_silent(),
	["n|<Leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent(),
	["n|<Leader>fw"] = map_cu("Telescope live_grep"):with_noremap():with_silent(),
	["n|<Leader>fs"] = map_cu("Telescope lsp_workspace_symbols"):with_noremap():with_silent(),
	-- ["n|<Leader>fb"] = map_cu("Telescope file_browser"):with_noremap():with_silent(),
	-- ["n|<Leader>fg"] = map_cu("Telescope git_files"):with_noremap():with_silent(),
	-- ["n|<Leader>fz"] = map_cu("Telescope zoxide list"):with_noremap():with_silent(),
	-- Plugin accelerate-jk
	["n|j"] = map_cmd("v:lua.enhance_jk_move('j')"):with_silent():with_expr(),
	["n|k"] = map_cmd("v:lua.enhance_jk_move('k')"):with_silent():with_expr(),
	-- Plugin EasyAlign
	-- ["n|ga"] = map_cmd("v:lua.enhance_align('nga')"):with_expr(),
	-- ["x|ga"] = map_cmd("v:lua.enhance_align('xga')"):with_expr(),
	-- Plugin split-term
	-- ["n|<F5>"] = map_cr("VTerm"):with_noremap():with_silent(),
	["n|<C-w>t"] = map_cr("VTerm"):with_noremap():with_silent(),
	-- Plugin MarkdownPreview
	-- ["n|<F12>"] = map_cr("MarkdownPreviewToggle"):with_noremap():with_silent(),
	-- Plugin auto_session
	["n|<leader>ss"] = map_cu("SaveSession"):with_noremap():with_silent(),
	["n|<leader>sr"] = map_cu("RestoreSession"):with_noremap():with_silent(),
	["n|<leader>sd"] = map_cu("DeleteSession"):with_noremap():with_silent(),
	-- Plugin SnipRun
	-- ["v|<leader>r"] = map_cr("SnipRun"):with_noremap():with_silent(),
	-- Plugin dap
	-- ["n|<F6>"] = map_cr("lua require('dap').continue()"):with_noremap():with_silent(),
	-- ["n|<leader>dr"] = map_cr("lua require('dap').continue()"):with_noremap():with_silent(),
	-- ["n|<leader>dd"] = map_cr("lua require('dap').terminate() require('dapui').close()"):with_noremap():with_silent(),
	-- ["n|<leader>db"] = map_cr("lua require('dap').toggle_breakpoint()"):with_noremap():with_silent(),
	-- ["n|<leader>dB"] = map_cr("lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))")
	-- 	:with_noremap()
	-- 	:with_silent(),
	-- ["n|<leader>dbl"] = map_cr("lua require('dap').list_breakpoints()"):with_noremap():with_silent(),
	-- ["n|<leader>drc"] = map_cr("lua require('dap').run_to_cursor()"):with_noremap():with_silent(),
	-- ["n|<leader>drl"] = map_cr("lua require('dap').run_last()"):with_noremap():with_silent(),

	-- ["n|<leader>dv"] = map_cr("lua require('dap').step_over()"):with_noremap():with_silent(),
	-- ["n|<F10>"] = map_cr("lua require('dap').step_into()"):with_noremap():with_silent(),
	-- ["n|<leader>di"] = map_cr("lua require('dap').step_into()"):with_noremap():with_silent(),
	-- ["n|<F11>"] = map_cr("lua require('dap').step_out()"):with_noremap():with_silent(),
	-- ["n|<leader>do"] = map_cr("lua require('dap').step_out()"):with_noremap():with_silent(),
	-- ["n|<leader>dl"] = map_cr("lua require('dap').repl.open()"):with_noremap():with_silent(),
	-- ["o|m"] = map_cu([[lua require('tsht').nodes()]]):with_silent(),
	-- ["c|Q"] = map_cu([[%SnipRun]]):with_silent(),

	-- Plugin Tabout
	["i|<A-l>"] = map_cmd([[<Plug>(TaboutMulti)]]):with_silent(),
	["i|<A-h>"] = map_cmd([[<Plug>(TaboutBackMulti)]]):with_silent(),
	-- formatter.nvim
	-- ["n|<leader>fm"] = map_cr("Format"):with_noremap():with_silent()
}

local lsp_map = {
	["n|]d"] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
	["n|[d"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
	["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
	["n|gd"] = map_cr("lua vim.lsp.buf.definition()"):with_noremap():with_silent(),
	["n|gD"] = map_cr("lua vim.lsp.buf.declaration()"):with_noremap():with_silent(),
	["n|<C-Up>"] = map_cr("lua require('lspsaga.action').smart_scroll_with_saga(-1)"):with_noremap():with_silent(),
	["n|<C-Down>"] = map_cr("lua require('lspsaga.action').smart_scroll_with_saga(1)"):with_noremap():with_silent(),
	["n|<leader>ca"] = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
	["v|<leader>ca"] = map_cu("Lspsaga range_code_action"):with_noremap():with_silent(),
	-- ["n|<leader>gr"] = map_cr("lua vim.lsp.buf.references()"):with_noremap():with_silent(),
	["n|<leader>gr"] = map_cu("Telescope lsp_references"):with_noremap():with_silent(),
	["n|<leader>rn"] = map_cr("Lspsaga rename"):with_noremap():with_silent(),
	["n|<leader>fs"] = map_cu("Telescope lsp_workspace_symbols"):with_noremap():with_silent(),
	["n|<leader>fm"] = map_cr("lua vim.lsp.buf.formatting_sync()"):with_noremap():with_silent(),
}

local dap_map = {
	-- vscode like debug keymaps
	["n|<F5>"] = map_cr("lua require('dap').continue()"):with_noremap():with_silent(),
	["n|<S-F5>"] = map_cr("lua require('dap').terminate()"):with_noremap():with_silent(),
	["n|<F6>"] = map_cr("lua require('dap').pause()"):with_noremap():with_silent(),
	["n|<F9>"] = map_cr("lua require('dap').toggle_breakpoint()"):with_noremap():with_silent(),
	["n|<F10>"] = map_cr("lua require('dap').step_over()"):with_noremap():with_silent(),
	["n|<F11>"] = map_cr("lua require('dap').step_into()"):with_noremap():with_silent(),
	["n|<S-F11>"] = map_cr("lua require('dap').step_out()"):with_noremap():with_silent(),
	["n|<leader>dd"] = map_cr("lua require('dap').terminate() require('dapui').close()"):with_noremap():with_silent(),
	["n|<leader>db"] = map_cr("lua require('dap').toggle_breakpoint()"):with_noremap():with_silent(),
	["n|<leader>dB"] = map_cr("lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))")
		:with_noremap()
		:with_silent(),
	["n|<leader>dl"] = map_cr("lua require('dap').repl.open()"):with_noremap():with_silent(),
	["n|<leader>dv"] = map_cr("lua require('dapui').eval(nil, {enter = true})"):with_noremap():with_silent(),
}

local gitsigns_map = {
	["n|[c"] = map_cu("lua require('gitsigns').prev_hunk()"):with_noremap():with_silent(),
	["n|]c"] = map_cu("lua require('gitsigns').next_hunk()"):with_noremap():with_silent(),
	["n|<leader>hs"] = map_cu("lua require('gitsigns').stage_hunk()"):with_noremap():with_silent(),
	["n|<leader>hr"] = map_cu("lua require('gitsigns').reset_hunk()"):with_noremap():with_silent(),
	["n|<leader>hR"] = map_cu("lua require('gitsigns').reset_buffer()"):with_noremap():with_silent(),
	["n|<leader>hp"] = map_cu("lua require('gitsigns').preview_hunk()"):with_noremap():with_silent(),
	["n|<leader>hu"] = map_cu("lua require('gitsigns').undo_stage_hunk()"):with_noremap():with_silent(),
}

-- map leader to space
local leader_map = function()
	vim.g.mapleader = " "
	vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
	vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

function M.load_global_mapping()
	leader_map()
	bind.nvim_load_gmapping(def_map)
	bind.nvim_load_gmapping(plug_map)
end

function M.lsp_on_attach(client, buffnr)
	bind.nvim_load_bmapping(lsp_map, buffnr)
end

function M.dap_on_attach()
	bind.nvim_load_gmapping(dap_map)
end

function M.gitsigns_on_attach(buffnr)
	bind.nvim_load_bmapping(gitsigns_map, buffnr)
end

return M

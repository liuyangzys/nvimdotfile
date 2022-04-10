local ui = {}

ui["kyazdani42/nvim-web-devicons"] = { opt = false }
-- ui["sainnhe/edge"] = {opt = false, config = conf.edge}
-- ui["rebelot/kanagawa.nvim"] = {opt = false, config = conf.kanagawa}
ui["catppuccin/nvim"] = {
	opt = false,
	as = "catppuccin",
	config = function()
		require("modules.ui.config.catppuccin")
	end,
}
ui["hoob3rt/lualine.nvim"] = {
	opt = true,
	after = "lualine-lsp-progress",
	config = function()
		require("modules.ui.config.lualine")
	end,
}
ui["arkav/lualine-lsp-progress"] = { opt = true, after = "nvim-gps" }

-- ui["glepnir/dashboard-nvim"] = { opt = true, event = "BufWinEnter" }

ui["kyazdani42/nvim-tree.lua"] = {
	opt = true,
	cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeRefresh" },
	config = function()
		require("modules.ui.config.nvim-tree")
	end,
}

ui["lewis6991/gitsigns.nvim"] = {
	opt = true,
	event = { "BufRead", "BufNewFile" },
	config = function()
		require("modules.ui.config.gitsigns")
	end,
	requires = { "nvim-lua/plenary.nvim" },
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	opt = true,
	event = "BufRead",
	config = function()
		require("modules.ui.config.indent_blankline")
	end,
}
ui["akinsho/bufferline.nvim"] = {
	opt = true,
	event = "BufRead",
	config = function()
		require("modules.ui.config.bufferline")
	end,
}
ui["petertriho/nvim-scrollbar"] = {
	opt = true,
	event = "BufRead",
	config = function()
		require("scrollbar").setup()
	end,
}
ui["beauwilliams/focus.nvim"] = {
	opt = true,
	cmd = { "FocusToggle", "FocusSplitNicely", "FocusSplitCycle" },
	module = "focus",
	config = function()
		require("focus").setup()
	end,
}
-- ui["wfxr/minimap.vim"] = {
-- 	opt = true,
-- 	event = "BufRead",
-- }

return ui

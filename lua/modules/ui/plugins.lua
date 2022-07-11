local ui = {}

ui["kyazdani42/nvim-web-devicons"] = { opt = false }
-- ui["sainnhe/edge"] = {opt = false, config = conf.edge}
-- ui["rebelot/kanagawa.nvim"] = {opt = false, config = conf.kanagawa}
ui["ellisonleao/gruvbox.nvim"] = {
  opt = false
}
ui["folke/tokyonight.nvim"] = {
  opt = false,
  config = function()
    require("modules.ui.config.tokyonight")
  end,
}
ui["catppuccin/nvim"] = {
  opt = false,
  as = "catppuccin",
  config = function()
    require("modules.ui.config.catppuccin")
  end,
}
ui["rcarriga/nvim-notify"] = {
  opt = false,
  config = function()
    require("modules.ui.config.nvim-notify")
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

ui["goolord/alpha-nvim"] = {
  opt = true,
  event = "BufWinEnter",
  config = function()
    require("modules.ui.config.alpha-nvim")
  end,
}

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
ui["dstein64/nvim-scrollview"] = {
  opt = true,
  event = { "BufRead" },
  config = function()
    require("scrollview").setup({})
  end,
}
ui["beauwilliams/focus.nvim"] = {
  opt = true,
  event = "WinEnter",
  config = function()
    require("focus").setup({
      excluded_filetypes = { "fterm", "term", "toggleterm", "Mundo", "MundoDiff" },
      signcolumn = false,
    })
  end
}
ui["mbbill/undotree"] = {
  opt = true,
  cmd = "UndotreeToggle",
}
return ui

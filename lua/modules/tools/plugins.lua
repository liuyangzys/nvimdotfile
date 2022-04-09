local tools = {}

tools["RishabhRD/popfix"] = {opt = false}

tools["nvim-lua/plenary.nvim"] = {opt = false}

tools["nvim-telescope/telescope.nvim"] = {
  opt = true,
  module = "telescope",
  cmd = "Telescope",
  config = function ()
    require('modules.tools.config.telescope')
  end,
  requires = {
    {"nvim-lua/plenary.nvim", opt = false},
    {"nvim-lua/popup.nvim", opt = true}
  }
}

tools["nvim-telescope/telescope-fzf-native.nvim"] = {
  opt = true,
  run = "make",
  after = "telescope.nvim"
}

tools["skywind3000/asyncrun.vim"] = {
  opt = true,
  cmd = {"AsyncRun", "AsyncStop"}
}

-- tools["nvim-telescope/telescope-project.nvim"] = {
-- 	opt = true,
-- 	after = "telescope-fzf-native.nvim",
-- }
-- tools["nvim-telescope/telescope-frecency.nvim"] = {
-- 	opt = true,
-- 	after = "telescope-project.nvim",
-- 	requires = { { "tami5/sqlite.lua", opt = true } },
-- }
-- tools["jvgrootveld/telescope-zoxide"] = { opt = true, after = "telescope-frecency.nvim" }
-- tools["michaelb/sniprun"] = {
--   opt = true,
--   run = "bash ./install.sh",
--   cmd = {"SnipRun", "'<,'>SnipRun"}
-- }
tools["folke/which-key.nvim"] = {
  opt = true,
  keys = "<leader>",
  config = function()
    require("which-key").setup({})
  end
}
tools["folke/trouble.nvim"] = {
	opt = true,
	cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
  config = function()
    require('modules.tools.config.trouble')
  end
}
tools["dstein64/vim-startuptime"] = {opt = true, cmd = "StartupTime"}

-- tools["gelguy/wilder.nvim"] = {
--   event = "CmdlineEnter",
--   config = conf.wilder,
--   requires = {{"romgrk/fzy-lua-native", after = "wilder.nvim"}}
-- }

tools["nathom/filetype.nvim"] = {
  opt = false,
  config = function()
    require('modules.tools.config.filetype')
  end
}

return tools

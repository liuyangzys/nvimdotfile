local tools = {}

tools["lewis6991/impatient.nvim"] = { opt = false }
tools["nvim-lua/plenary.nvim"] = { opt = false }


tools["nvim-telescope/telescope.nvim"] = {
  opt = true,
  module = "telescope",
  cmd = "Telescope",
  after = "alpha-nvim",
  config = require("modules.tools.config.telescope").config,
  requires = {
    { "nvim-lua/plenary.nvim", opt = false },
  },
}

tools["nvim-telescope/telescope-project.nvim"] = {
  opt = true,
  after = "telescope.nvim",
  config = require("modules.tools.config.telescope").extension_project_config,
}

tools["nvim-telescope/telescope-ui-select.nvim"] = {
  opt = true,
  after = "telescope.nvim",
  config = require("modules.tools.config.telescope").extension_ui_select_config,
}

tools["nvim-telescope/telescope-fzf-native.nvim"] = {
  opt = true,
  run = "make",
  after = "telescope.nvim",
  config = require("modules.tools.config.telescope").extension_fzf_config,
}

tools["skywind3000/asyncrun.vim"] = {
  opt = true,
  cmd = { "AsyncRun", "AsyncStop" },
}

tools["sindrets/diffview.nvim"] = {
  opt = true,
  cmd = { "DiffviewOpen", "DiffviewClose" },
  event = "BufRead",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("modules.tools.config.diffview")
  end,
}



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
  end,
}
tools["folke/trouble.nvim"] = {
  opt = true,
  cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
  after = "telescope.nvim",
  config = require("modules.tools.config.trouble").config,
}
-- tools["kevinhwang91/nvim-bqf"] = {
--   opt = true,
--   ft = "qf",
--   config = require("modules.tools.config.nvim-bqf").config
-- }
tools["dstein64/vim-startuptime"] = { opt = true, cmd = "StartupTime" }

-- tools["gelguy/wilder.nvim"] = {
--   event = "CmdlineEnter",
--   config = conf.wilder,
--   requires = {{"romgrk/fzy-lua-native", after = "wilder.nvim"}}
-- }

tools["nathom/filetype.nvim"] = {
  opt = false,
  config = require("modules.tools.config.filetype").config;
}

return tools

local editor = {}

editor["RRethy/vim-illuminate"] = {
  event = "BufRead",
  config = function()
    vim.g.Illuminate_highlightUnderCursor = 1
    vim.g.Illuminate_ftblacklist = {
      "help",
      "dashboard",
      "alpha",
      "packer",
      "norg",
      "DoomInfo",
      "NvimTree",
      "Outline",
      "toggleterm",
      "aerial",
      "git"
    }
  end,
}
editor["numToStr/Comment.nvim"] = {
  opt = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("modules.editor.config.Comment")
  end,
}

editor["nvim-treesitter/nvim-treesitter"] = {
  opt = true,
  run = ":TSUpdate",
  event = "BufRead",
  config = function()
    require("modules.editor.config.nvim-treesitter")
  end,
}
editor["nvim-treesitter/nvim-treesitter-textobjects"] = {
  opt = true,
  after = "nvim-treesitter",
}
editor["romgrk/nvim-treesitter-context"] = {
  opt = true,
  after = "nvim-treesitter",
}
editor["p00f/nvim-ts-rainbow"] = {
  opt = true,
  after = "nvim-treesitter",
  event = "BufRead",
}
editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
  opt = true,
  after = "nvim-treesitter",
}
editor["mfussenegger/nvim-ts-hint-textobject"] = {
  opt = true,
  after = "nvim-treesitter",
}
editor["SmiteshP/nvim-gps"] = {
  opt = true,
  after = "nvim-treesitter",
  config = function()
    require("modules.editor.config.nvim-gps")
  end,
}
editor["windwp/nvim-ts-autotag"] = {
  opt = true,
  ft = { "html", "xml" },
  config = function()
    require("modules.editor.config.nvim-ts-autotag")
  end,
}
editor["andymass/vim-matchup"] = {
  opt = true,
  after = "nvim-treesitter",
  setup = function()
    vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
    vim.cmd([[let g:matchup_surround_enabled = 1]])
  end,
}
editor["rhysd/accelerated-jk"] = { opt = false }

editor["ggandor/lightspeed.nvim"] = {
  opt = true,
  event = "BufReadPost",
}
editor["karb94/neoscroll.nvim"] = {
  opt = true,
  event = "BufReadPost",
  config = function()
    require("modules.editor.config.neoscroll")
  end,
}
-- editor["vimlab/split-term.vim"] = { opt = true, cmd = { "Term", "VTerm" } }
editor["akinsho/nvim-toggleterm.lua"] = {
  opt = true,
  event = "BufRead",
  config = function()
    require("modules.editor.config.nvim-toggleterm")
  end,
}
-- editor["numtostr/FTerm.nvim"] = {
-- 	opt = true,
-- 	event = "BufRead",
-- 	config = function()
-- 		require("modules.editor.config.Fterm")
-- 	end,
-- }
editor["norcalli/nvim-colorizer.lua"] = {
  opt = true,
  event = "BufRead",
  config = function()
    require("modules.editor.config.nvim-colorizer")
  end,
}

editor["Shatur/neovim-session-manager"] = {
  opt = true,
  cmd = { "SessionManager" },
  after = "telescope.nvim",
  config = function()
    require("modules.editor.config.neovim-session-manager")
  end,
}

-- use 'jk' as Esc
editor["jdhao/better-escape.vim"] = { opt = true, event = "InsertEnter" }

-- editor["puremourning/vimspector"] = {
--   opt = true,
--   -- keys = "<F5>",
--   setup = function()
--     vim.g.vimspector_enable_mappings = "VISUAL_STUDIO"
--   end,
--   config = function()
--     require("modules.editor.config.vimspector")
--   end,
-- }

editor["rcarriga/nvim-dap-ui"] = {
  opt = true,
  config = function()
    require("modules.editor.config.nvim-dap-ui")
  end,
  keys = "<F5>",
  requires = {
    {
      "mfussenegger/nvim-dap",
      config = function()
        require("modules.editor.config.nvim-dap")
      end,
    },
  },
}
editor["theHamsta/nvim-dap-virtual-text"] = {
  opt = true,
  after = "nvim-dap-ui",
  config = function()
    require('nvim-dap-virtual-text').setup()
  end
}

editor["tpope/vim-fugitive"] = { opt = true, cmd = { "Git", "G" } }
-- editor["TimUntersberger/neogit"] = {
--   opt = true,
--   cmd = { "Neogit" },
--   config = function()
--     require("modules.editor.config.neogit")
--   end,
--   requires = { "nvim-lua/plenary.nvim" },
-- }
editor["famiu/bufdelete.nvim"] = {
  opt = true,
  cmd = { "Bdelete", "Bwipeout", "Bdelete!", "Bwipeout!" },
}
-- editor["edluffy/specs.nvim"] = {
-- 	opt = true,
-- 	event = "CursorMoved",
-- 	config = function()
-- 		require("modules.editor.config.specs")
-- 	end,
-- }
editor["abecodes/tabout.nvim"] = {
  opt = true,
  event = "InsertEnter",
  wants = "nvim-treesitter",
  after = "nvim-cmp",
  config = function()
    require("modules.editor.config.tabout")
  end,
}

return editor

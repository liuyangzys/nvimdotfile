local editor = {}
-- local conf = require("modules.editor.config")

editor["junegunn/vim-easy-align"] = {opt = true, event = "BufReadPost", cmd = "EasyAlign"}

editor["mhartington/formatter.nvim"] = {
  opt = true,
  cmd = "Format",
  config = function()
    require("modules.editor.config.formatter")
  end
}

editor["itchyny/vim-cursorword"] = {
  opt = true,
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    require("modules.editor.config.vim-cursorwod")
  end
}
editor["terrortylor/nvim-comment"] = {
  opt = false,
  config = function()
    require("nvim_comment").setup(
      {
        hook = function()
          require("ts_context_commentstring.internal").update_commentstring()
        end
      }
    )
  end
}
editor["nvim-treesitter/nvim-treesitter"] = {
  opt = true,
  run = ":TSUpdate",
  event = "BufRead",
  config = function()
    require("modules.editor.config.nvim-treesitter")
  end
}
editor["nvim-treesitter/nvim-treesitter-textobjects"] = {
  opt = true,
  after = "nvim-treesitter"
}
editor["romgrk/nvim-treesitter-context"] = {
  opt = true,
  after = "nvim-treesitter"
}
editor["p00f/nvim-ts-rainbow"] = {
  opt = true,
  after = "nvim-treesitter",
  event = "BufRead"
}
editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
  opt = true,
  after = "nvim-treesitter"
}
editor["mfussenegger/nvim-ts-hint-textobject"] = {
  opt = true,
  after = "nvim-treesitter"
}
editor["SmiteshP/nvim-gps"] = {
  opt = true,
  after = "nvim-treesitter",
  config = function()
    require("modules.editor.config.nvim-gps")
  end
}
editor["windwp/nvim-ts-autotag"] = {
  opt = true,
  ft = {"html", "xml"},
  config = function()
    require("modules.editor.config.nvim-ts-autotag")
  end
}
editor["andymass/vim-matchup"] = {
  opt = true,
  after = "nvim-treesitter",
  config = function()
    vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
  end
}
editor["rhysd/accelerated-jk"] = {opt = true, event = "BufReadPost"}
editor["ggandor/lightspeed.nvim"] = {
  opt = true,
  event = "BufReadPost"
}
editor["karb94/neoscroll.nvim"] = {
  opt = true,
  event = "WinScrolled",
  config = function()
    require("modules.editor.config.neoscroll")
  end
}
editor["vimlab/split-term.vim"] = {opt = true, cmd = {"Term", "VTerm"}}
-- editor["akinsho/nvim-toggleterm.lua"] = {
-- 	opt = true,
-- 	event = "BufRead",
-- 	config = conf.toggleterm,
-- }
-- editor["numtostr/FTerm.nvim"] = { opt = true, event = "BufRead" }
editor["norcalli/nvim-colorizer.lua"] = {
  opt = true,
  event = "BufRead",
  config = function()
    require("modules.editor.config.nvim-colorizer")
  end
}
editor["rmagatti/auto-session"] = {
  opt = true,
  cmd = {"SaveSession", "RestoreSession", "DeleteSession"},
  config = function()
    require("modules.editor.config.auto-session")
  end
}
editor["jdhao/better-escape.vim"] = {opt = true, event = "InsertEnter"}
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
      end
    }
  }
}
editor["tpope/vim-fugitive"] = {opt = true, cmd = {"Git", "G"}}
editor["TimUntersberger/neogit"] = {
  opt = true,
  cmd = {"Neogit"},
  config = function()
    require("modules.editor.config.neogit")
  end,
  requires = {"nvim-lua/plenary.nvim"}
}
editor["famiu/bufdelete.nvim"] = {
  opt = true,
  cmd = {"Bdelete", "Bwipeout", "Bdelete!", "Bwipeout!"}
}
editor["edluffy/specs.nvim"] = {
  opt = true,
  event = "CursorMoved",
  config = function()
    require("modules.editor.config.specs")
  end,
}
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

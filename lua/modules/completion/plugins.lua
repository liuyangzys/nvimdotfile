local completion = {}

completion["neovim/nvim-lspconfig"] = {
  opt = true,
  event = "BufReadPre",
  config = function()
    require("modules.completion.config.lsp_config")
  end,
}
completion["williamboman/nvim-lsp-installer"] = {
  opt = false,
  -- after = "nvim-lspconfig",
  -- config = function()
  -- require("modules.completion.config.lsp_installer")
  -- end,
}
completion["jose-elias-alvarez/null-ls.nvim"] = {
  opt = true,
  after = "nvim-lspconfig",
  config = function()
    require("modules.completion.config.null-ls")
  end,
}

-- completion["tami5/lspsaga.nvim"] = {
-- 	opt = true,
-- 	after = "nvim-lspconfig",
-- 	config = function()
-- 		require("modules.completion.config.lsp_saga")
-- 	end,
-- }

completion["stevearc/aerial.nvim"] = {
  opt = true,
  after = "nvim-lspconfig",
  config = function()
    require("modules.completion.config.aerial")
  end,
}

-- completion["kosayoda/nvim-lightbulb"] = {
-- 	opt = true,
-- 	after = "nvim-lspconfig",
-- 	config = function()
-- 		vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
-- 	end,
-- }

completion["ray-x/lsp_signature.nvim"] = { opt = true, after = "nvim-lspconfig" }

completion["hrsh7th/nvim-cmp"] = {
  event = "InsertEnter",
  after = "nvim-lspconfig",
  requires = {
    { "lukas-reineke/cmp-under-comparator", opt = true },
    { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
    { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
    -- { "andersevenrud/cmp-tmux", after = "nvim-cmp" },
    { "hrsh7th/cmp-path", after = "nvim-cmp" },
    { "f3fora/cmp-spell", after = "nvim-cmp" },
    { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
    { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
    { "kdheepak/cmp-latex-symbols", after = "nvim-cmp" },
    -- {
    --     'tzachar/cmp-tabnine',
    --     run = './install.sh',
    --     after = 'cmp-spell',
    --     config = conf.tabnine
    -- }
  },
  config = function()
    require("modules.completion.config.nvim-cmp")
  end,
}

completion["L3MON4D3/LuaSnip"] = {
  opt = true,
  after = { "nvim-cmp" },
  requires = { "rafamadriz/friendly-snippets", opt = true },
  config = function()
    require("modules.completion.config.luasnip")
  end,
}

completion["danymat/neogen"] = {
  opt = true,
  cmd = "Neogen",
  config = function()
    require("modules.completion.config.neogen")
  end,
}

completion["windwp/nvim-autopairs"] = {
  event = "InsertEnter",
  config = function()
    require("modules.completion.config.nvim-autopairs")
  end,
}

-- completion["github/copilot.vim"] = { opt = true, cmd = "Copilot" }

return completion

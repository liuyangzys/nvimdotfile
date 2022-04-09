local completion = {}

completion["neovim/nvim-lspconfig"] = {
  opt = true,
  event = "BufReadPre",
}
-- completion["creativenull/efmls-configs-nvim"] = {
-- 	opt = false,
-- 	requires = "neovim/nvim-lspconfig",
-- }
completion["williamboman/nvim-lsp-installer"] = {
  opt = true,
  after = "nvim-lspconfig",
  config = function()
    require('modules.completion.config.lsp_installer')
  end
}
-- completion["RishabhRD/nvim-lsputils"] = {
-- 	opt = true,
-- 	after = "nvim-lspconfig",
-- 	config = conf.nvim_lsputils,
-- }
completion["tami5/lspsaga.nvim"] = {
  opt = true,
  after = "nvim-lspconfig",
  config = function()
    require('modules.completion.config.lsp_saga')
  end
}

completion["stevearc/aerial.nvim"] = {
  opt = true,
  after = "nvim-lspconfig",
  config = function()
    require('modules.completion.config.aerial')
  end
}

completion["kosayoda/nvim-lightbulb"] = {
  opt = true,
  after = "nvim-lspconfig",
  config = function()
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
  end
}

completion["ray-x/lsp_signature.nvim"] = {opt = true, after = "nvim-lspconfig"}

completion["hrsh7th/nvim-cmp"] = {
  event = "InsertEnter",
  requires = {
    {"lukas-reineke/cmp-under-comparator", opt = true},
    {"saadparwaiz1/cmp_luasnip", after = "nvim-cmp"},
    {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"},
    {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"},
    {"andersevenrud/cmp-tmux", after = "nvim-cmp"},
    {"hrsh7th/cmp-path", after = "nvim-cmp"},
    {"f3fora/cmp-spell", after = "nvim-cmp"},
    {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
    {"hrsh7th/cmp-cmdline", after = "nvim-cmp"},
    {"kdheepak/cmp-latex-symbols", after = "nvim-cmp"}
    -- {
    --     'tzachar/cmp-tabnine',
    --     run = './install.sh',
    --     after = 'cmp-spell',
    --     config = conf.tabnine
    -- }
  },
  config = function()
    require('modules.completion.config.nvim-cmp')
  end
}

completion["L3MON4D3/LuaSnip"] = {
  opt = true,
  after = {"nvim-cmp"},
  requires = "rafamadriz/friendly-snippets",
  config = function()
    require('modules.completion.config.luasnip')
  end
}

completion["danymat/neogen"] = {
  opt = true,
  cmd = "Neogen",
  config = function()
    require('modules.completion.config.neogen')
  end
}

completion["windwp/nvim-autopairs"] = {
  after = "nvim-cmp",
  event = "InsertEnter",
  config = function()
    require('modules.completion.config.autopairs')
  end
}

-- completion["github/copilot.vim"] = { opt = true, cmd = "Copilot" }

return completion

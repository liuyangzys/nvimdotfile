local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  vim.notify("autopairs not found!")
  return
end

vim.cmd([[packadd nvim-cmp]])

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
}

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

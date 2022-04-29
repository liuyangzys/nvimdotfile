local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  vim.notify("autopairs not found!")
  return
end

vim.cmd([[packadd nvim-cmp]])

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false,
  },
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

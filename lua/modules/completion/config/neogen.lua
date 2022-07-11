local M = {}

M.config = function()
  local neogen_ok, neogen = pcall(require, "neogen")
  if not neogen_ok then
    vim.notify("neogen not found!")
    return
  end

  vim.cmd([[packadd LuaSnip]])
  neogen.setup({
    snippet_engine = "luasnip",
  })
end

return M

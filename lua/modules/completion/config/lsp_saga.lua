local lspsaga_ok, lspsaga = pcall(require, "lspsaga")
if not lspsaga_ok then
  vim.notify("lspsaga not found!")
  return
end

lspsaga.init_lsp_saga(
  {
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = ""
  }
)

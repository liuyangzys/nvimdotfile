local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
  vim.notify("aerial not found")
  return
end

-- Call the setup function to change the default behavior
aerial.setup({})

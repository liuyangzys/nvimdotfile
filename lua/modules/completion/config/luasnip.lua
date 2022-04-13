local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	vim.notify("luasnip not found!")
	return
end

luasnip.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
})

vim.cmd([[packadd friendly-snippets]])
require("luasnip/loaders/from_vscode").load()

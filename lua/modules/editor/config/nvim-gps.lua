local nvim_gps_ok, nvim_gps = pcall(require, "nvim-gps")
if not nvim_gps_ok then
	vim.notify("nvim-gps not found!")
	return
end

nvim_gps.setup({
	icons = {
		["class-name"] = " ", -- Classes and class-like objects
		["function-name"] = " ", -- Functions
		["method-name"] = " ", -- Methods (functions inside class-like objects)
	},
	languages = {
		-- You can disable any language individually here
		["c"] = true,
		["cpp"] = true,
		["go"] = true,
		["java"] = true,
		["javascript"] = true,
		["lua"] = true,
		["python"] = true,
		["rust"] = true,
	},
	separator = " > ",
})

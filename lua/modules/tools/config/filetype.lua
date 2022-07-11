local M = {}

M.config = function()
  require("filetype").setup({
    overrides = {
      shebang = {
        -- Set the filetype of files with a dash shebang to sh
        dash = "sh",
      },
    },
  })
end

return M

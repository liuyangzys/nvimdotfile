local M = {}

M.config = function()
  local neogit = require("neogit")
  neogit.setup({
    integrations = {
      diffview = true
    },
  })
end

return M

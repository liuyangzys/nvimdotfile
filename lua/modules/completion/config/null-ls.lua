local M = {}


M.config = function()

  local null_ls_status_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_status_ok then
    vim.notify("null-ls not found!")
    return
  end

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local completion = null_ls.builtins.completion

  null_ls.setup({
    debug = false,
    sources = {
      formatting.autopep8, -- for python

      -- formatting.stylua, -- for lua
      -- formatting.clang_format, -- for cpp
      -- formatting.gofmt,       -- for golang
      -- diagnostics.flake8,

      completion.spell,
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd([[
            augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua require('modules.completion.config.formatting').format()
            augroup END
            ]])
      end
    end,
  })
end

return M

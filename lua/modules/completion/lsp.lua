-- vim.cmd([[packadd nvim-lsp-installer]])
-- vim.cmd([[packadd lsp_signature.nvim]])
-- vim.cmd([[packadd cmp-nvim-lsp]])
-- vim.cmd([[packadd aerial.nvim]])

local M = {}

local function custom_attach(client, buffnr)
  require("lsp_signature").on_attach(
    {
      bind = true,
      use_lspsaga = false,
      floating_window = true,
      fix_pos = true,
      hint_enable = true,
      hi_parameter = "Search",
      handler_opts = {"double"}
    }
  )
  require("aerial").on_attach(client)
  require("keymap").lsp_on_attach(client, buffnr)
end

local enhance_server_opts = {
  ["sumneko_lua"] = function(opts)
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    opts.settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {"vim"}
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true)
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false
        }
      }
    }
  end,
  ["clangd"] = function(opts)
    opts.args = {
      "--background-index",
      -- "-std=c++20",
      "--pch-storage=memory",
      "--clang-tidy",
      "--suggest-missing-includes"
    }
    -- opts.capabilities.offsetEncoding = { "utf-16" }
    opts.single_file_support = true
    -- Disable `clangd`'s format
    opts.on_attach = function(client, buffnr)
      -- client.resolved_capabilities.document_formatting = false
      custom_attach(client, buffnr)
    end
  end,
  ["jsonls"] = function(opts)
    opts.settings = {
      json = {
        -- Schemas https://www.schemastore.org
        schemas = {
          {
            fileMatch = {"package.json"},
            url = "https://json.schemastore.org/package.json"
          },
          {
            fileMatch = {"tsconfig*.json"},
            url = "https://json.schemastore.org/tsconfig.json"
          },
          {
            fileMatch = {
              ".prettierrc",
              ".prettierrc.json",
              "prettier.config.json"
            },
            url = "https://json.schemastore.org/prettierrc.json"
          },
          {
            fileMatch = {".eslintrc", ".eslintrc.json"},
            url = "https://json.schemastore.org/eslintrc.json"
          },
          {
            fileMatch = {
              ".babelrc",
              ".babelrc.json",
              "babel.config.json"
            },
            url = "https://json.schemastore.org/babelrc.json"
          },
          {
            fileMatch = {"lerna.json"},
            url = "https://json.schemastore.org/lerna.json"
          },
          {
            fileMatch = {
              ".stylelintrc",
              ".stylelintrc.json",
              "stylelint.config.json"
            },
            url = "http://json.schemastore.org/stylelintrc.json"
          },
          {
            fileMatch = {"/.github/workflows/*"},
            url = "https://json.schemastore.org/github-workflow.json"
          }
        }
      }
    }
  end,
  ["tsserver"] = function(opts)
    -- Disable `tsserver`'s format
    opts.on_attach = function(client, buffnr)
      -- client.resolved_capabilities.document_formatting = false
      custom_attach(client, buffnr)
    end
  end,
  ["dockerls"] = function(opts)
    -- Disable `dockerls`'s format
    opts.on_attach = function(client, buffnr)
      -- client.resolved_capabilities.document_formatting = false
      custom_attach(client, buffnr)
    end
  end,
  ["gopls"] = function(opts)
    opts.settings = {
      gopls = {
        usePlaceholders = true,
        analyses = {
          nilness = true,
          shadow = true,
          unusedparams = true,
          unusewrites = true
        }
      }
    }
    -- Disable `gopls`'s format
    opts.on_attach = function(client, buffnr)
      -- client.resolved_capabilities.document_formatting = false
      custom_attach(client, buffnr)
    end
  end
}

function M.nvim_lsp_config()
  -- local nvim_lsp = require("lspconfig")
  -- nvim_lsp.html.setup({})
end

function M.lsp_installer_config()
  local lsp_installer = require("nvim-lsp-installer")
  lsp_installer.settings(
    {
      ui = {
        icons = {
          server_installed = "✓",
          server_pending = "➜",
          server_uninstalled = "✗"
        }
      }
    }
  )
  lsp_installer.on_server_ready(
    function(server)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
      local opts = {
        capabilities = capabilities,
        flags = {debounce_text_changes = 500},
        on_attach = custom_attach
      }

      if enhance_server_opts[server.name] then
        enhance_server_opts[server.name](opts)
      end

      server:setup(opts)
    end
  )
end

return M

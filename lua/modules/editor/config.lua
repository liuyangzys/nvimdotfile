local config = {}
local sessions_dir = vim.fn.stdpath("data") .. "/sessions/"

function config.formatter()
  -- vim.cmd([[augroup Format]])
  -- vim.cmd([[autocmd! * <buffer>]])
  -- vim.cmd([[autocmd BufWritePost <buffer> FormatWrite]])
  -- vim.cmd([[augroup END]])

  require("formatter").setup(
    {
      logging = false,
      filetype = {
        rust = {
          -- Rustfmt
          function()
            return {
              exe = "rustfmt",
              args = {"--emit=stdout", "--edition=2021"},
              stdin = true
            }
          end
        },
        python = {
          -- autopep8
          function()
            return {
              exe = "python3 -m autopep8",
              args = {
                "--in-place --aggressive --aggressive",
                vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
              },
              stdin = false
            }
          end
        },
        c = {
          -- clang-format
          function()
            return {
              exe = "clang-format",
              args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
              stdin = true,
              cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
            }
          end
        },
        cpp = {
          -- clang-format
          function()
            return {
              exe = "clang-format",
              args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
              stdin = true,
              cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
            }
          end
        },
        lua = {
          -- luafmt
          function()
            return {
              exe = "luafmt",
              args = {"--indent-count", 2, "--stdin"},
              stdin = true
            }
          end
        }
      }
    }
  )
end

function config.vim_cursorwod()
  vim.api.nvim_command("augroup user_plugin_cursorword")
  vim.api.nvim_command("autocmd!")
  vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard let b:cursorword = 0")
  vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
  vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
  vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
  vim.api.nvim_command("augroup END")
end

function config.nvim_treesitter()
  vim.api.nvim_command("set foldmethod=expr")
  vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

  require("nvim-treesitter.configs").setup(
    {
      ensure_installed = "maintained",
      highlight = {enable = true, disable = {"vim"}},
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner"
          }
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]["] = "@function.outer",
            ["]m"] = "@class.outer"
          },
          goto_next_end = {
            ["]]"] = "@function.outer",
            ["]M"] = "@class.outer"
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
            ["[m"] = "@class.outer"
          },
          goto_previous_end = {
            ["[]"] = "@function.outer",
            ["[M"] = "@class.outer"
          }
        }
      },
      rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
      },
      context_commentstring = {enable = true, enable_autocmd = false},
      matchup = {enable = true},
      context = {enable = true, throttle = true}
    }
  )
  require("nvim-treesitter.install").prefer_git = true
  local parsers = require("nvim-treesitter.parsers").get_parser_configs()
  for _, p in pairs(parsers) do
    p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
  end
end

function config.matchup()
  vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
end

function config.nvim_gps()
  require("nvim-gps").setup(
    {
      icons = {
        ["class-name"] = " ", -- Classes and class-like objects
        ["function-name"] = " ", -- Functions
        ["method-name"] = " " -- Methods (functions inside class-like objects)
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
        ["rust"] = true
      },
      separator = " > "
    }
  )
end

function config.autotag()
  require("nvim-ts-autotag").setup(
    {
      filetypes = {
        "html",
        "xml",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "vue"
      }
    }
  )
end

function config.nvim_colorizer()
  require("colorizer").setup()
end

function config.neoscroll()
  require("neoscroll").setup(
    {
      -- All these keys will be mapped to their corresponding default scrolling animation
      mappings = {
        "<C-u>",
        "<C-d>",
        "<C-b>",
        "<C-f>",
        "<C-y>",
        "<C-e>",
        "zt",
        "zz",
        "zb"
      },
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = true, -- Stop at <EOF> when scrolling downwards
      use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = nil, -- Default easing function
      pre_hook = nil, -- Function to run before the scrolling animation starts
      post_hook = nil -- Function to run after the scrolling animation ends
    }
  )
end

function config.auto_session()
  local opts = {
    log_level = "info",
    auto_session_enable_last_session = true,
    auto_session_root_dir = sessions_dir,
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = nil
  }

  require("auto-session").setup(opts)
end

function config.neogit()
  local neogit = require("neogit")
  neogit.setup {}
end

-- function config.toggleterm()
-- 	require("toggleterm").setup({
-- 		-- size can be a number or function which is passed the current terminal
-- 		size = function(term)
-- 			if term.direction == "horizontal" then
-- 				return 15
-- 			elseif term.direction == "vertical" then
-- 				return vim.o.columns * 0.40
-- 			end
-- 		end,
-- 		open_mapping = [[<c-\>]],
-- 		hide_numbers = true, -- hide the number column in toggleterm buffers
-- 		shade_filetypes = {},
-- 		shade_terminals = false,
-- 		shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
-- 		start_in_insert = true,
-- 		insert_mappings = true, -- whether or not the open mapping applies in insert mode
-- 		persist_size = true,
-- 		direction = "horizontal",
-- 		close_on_exit = true, -- close the terminal window when the process exits
-- 		shell = vim.o.shell, -- change the default shell
-- 	})
-- end

--- DAP configs --------------------------------------------------------------

function config.dapui()
  vim.cmd([[packadd nvim-dap]])
  local dap = require("dap")
  local dapui = require("dapui")

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.disconnect["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.after.event_initialized["dapui"] = function()
    dapui.open()
  end
  dap.listeners.after.event_terminated["dapui"] = function()
    dapui.close()
  end
  dap.listeners.after.event_exited["dapui"] = function()
    dapui.close()
  end

  vim.fn.sign_define("DapBreakpoint", {text = "🛑", texthl = "", linehl = "", numhl = ""})

  dapui.setup(
    {
      icons = {expanded = "▾", collapsed = "▸"},
      mappings = {
        -- Use a table to apply multiple mappings
        expand = {"<CR>", "<2-LeftMouse>"},
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r"
      },
      sidebar = {
        elements = {
          -- Provide as ID strings or tables with "id" and "size" keys
          {
            id = "scopes",
            size = 0.45 -- Can be float or integer > 1
          },
          {id = "watches", size = 0.35},
          {id = "stacks", size = 0.15},
          {id = "breakpoints", size = 0.15}
        },
        size = 40,
        position = "left"
      },
      tray = {elements = {"repl"}, size = 5, position = "bottom"},
      floating = {
        max_height = nil,
        max_width = nil,
        mappings = {close = {"q", "<Esc>"}}
      },
      windows = {indent = 1}
    }
  )
end

function config.dap()
  local dap = require("dap")

  -- set keymaps for dap
  require("keymap").dap_on_attach()

   dap.adapters.python = {
    type = "executable",
    command = "python",
    args = {"-m", "debugpy.adapter"}
  }
  dap.configurations.python = {}

  dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    -- command = os.getenv("HOME") .. "/.vscode/extensions/ms-vscode.cpptools-1.9.7/debugAdapters/bin/OpenDebugAD7"
    command = "C:/Users/liuya/.vscode/extensions/ms-vscode.cpptools-1.9.7/debugAdapters/bin/OpenDebugAD7"
  }
  dap.configurations.c ={}
  dap.configurations.cpp ={}

  -- load from json file
  require("dap.ext.vscode").load_launchjs(nil, {cppdbg = {"c", "cpp"}, python = {"python"}})
end

function config.specs()
  require("specs").setup(
    {
      show_jumps = true,
      min_jump = 10,
      popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 10, -- time increments used for fade/resize effects
        blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 10,
        winhl = "PMenu",
        fader = require("specs").pulse_fader,
        resizer = require("specs").shrink_resizer
      },
      ignore_filetypes = {},
      ignore_buftypes = {nofile = true}
    }
  )
end

function config.tabout()
  require("tabout").setup(
    {
      tabkey = "<A-l>",
      backwards_tabkey = "<A-h>",
      ignore_beginning = false,
      act_as_tab = true,
      enable_backward = true,
      completion = true,
      tabouts = {
        {open = "'", close = "'"},
        {open = '"', close = '"'},
        {open = "`", close = "`"},
        {open = "(", close = ")"},
        {open = "[", close = "]"},
        {open = "{", close = "}"}
      },
      exclude = {}
    }
  )
end

return config

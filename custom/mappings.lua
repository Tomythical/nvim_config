---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.neotest = {
  plugin = true,
  n = {
    ["<leader>tf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
    },
    ["<leader>ta"] = {
      function()
        require("neotest").run.attach()
      end,
    },
    ["<leader>ts"] = {
      function()
        require("neotest").summary.toggle()
      end,
    },
    ["<leader>tp"] = {
      function()
        require("neotest").output_panel.toggle()
      end,
    },
    ["<leader>tw"] = {
      function()
        require("neotest").watch.toggle(vim.fn.expand "%")
      end,
    },
  },
}

-- more keybinds!
-- M.dap = {
--   plugin = true,
--   n = {
--     ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
--   }
-- }
--
-- M.dap_python = {
--   plugin = true,
--   n = {
--     ["<leader>dpr"] = {
--       function()
--         require('dap-python').test_method()
--       end
--     }
--   }
-- }

return M

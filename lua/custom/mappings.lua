---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader><leader>"] = { ":nohls<CR>", "clear search highlight", opts = { silent = true } },

    ["<leader>nt"] = { "<cmd>tabnew<CR>" },
    ["<leader>tn"] = { "<cmd>tabNext<CR>" },
    ["<leader>tp"] = { "<cmd>tabprevious<CR>" },
    ["<leader>tx"] = { "<cmd>tabclose<CR>" },

    ["<C-s>"] = { "<cmd>w | mksession!<CR>" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

return M

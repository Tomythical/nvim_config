-- local autocmd = vim.api.nvim_create_autocmd

local opt = vim.opt

opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.pumheight = 5
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

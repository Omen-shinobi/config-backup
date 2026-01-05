-- 1. STUTTER-FREE PERFORMANCE SETTINGS
vim.opt.number = true          -- Absolute numbers (FAST)
vim.opt.relativenumber = false -- DISABLE: This causes the Foot stutter
vim.opt.cursorline = false     -- DISABLE: This causes redraw lag in software rendering
vim.opt.lazyredraw = true      -- Don't redraw while scrolling/macros

-- 2. ENABLE LSP (C/C++ & Python)
-- In Neovim 0.11+, you use vim.lsp.enable for maximum speed
vim.lsp.enable('clangd')  -- For C and C++
vim.lsp.enable('pyright') -- For Python

-- 3. NATIVE AUTOCOMPLETE (No heavy plugins needed)
-- This uses the built-in 'omnifunc' for completion. 
-- In Insert Mode, press <Ctrl-x><Ctrl-o> to see suggestions.
vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

-- 4. KEYBINDINGS
local buf = vim.lsp.buf
vim.keymap.set('n', 'gd', buf.definition, { desc = "Go to Definition" })
vim.keymap.set('n', 'K', buf.hover, { desc = "Hover Info" })
vim.keymap.set('n', '<leader>rn', buf.rename, { desc = "Rename Symbol" })

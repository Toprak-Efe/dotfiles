-- Settings
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.number=true
vim.o.hlsearch=true
vim.o.showmatch=true
vim.o.expandtab=true
vim.o.wildmode="longest:full,full"
vim.o.relativenumber = true
vim.o.hidden = true
vim.opt.swapfile = false
vim.opt.fillchars = { eob = ' '}

-- Theme and Transparency
vim.opt.termguicolors = true

-- Keybinds
vim.g.mapleader = " "

-- Effects
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
--- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    }
})

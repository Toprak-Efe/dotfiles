vim.lsp.config.luals = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
}
vim.lsp.config.clangd = {
    cmd = { "clangd" },
    root_markers = { '.clangd', 'compile_commands.json' },
    filetypes = { 'c', 'cpp' },
}
vim.lsp.config.neocmake = {
    cmd = { 'neocmakelsp', '--stdio' },
    filetypes = { 'cmake' },
    root_markers = { '.git', 'build', 'cmake' },
}

vim.lsp.enable({
    "luals",
    "clangd",
    "neocmake",
})

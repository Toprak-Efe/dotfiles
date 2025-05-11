return {
    { 'echasnovski/mini.pairs', version = false },
    {
        'dstein64/vim-startuptime',
        keys = {
            {
                "<leader>stt",
                "<Cmd>StartupTime<CR>",
                mode = "n",
                desc = "View Startup Blame"
            }
        }
    },                           --- Show Start-up Blame
    {                                                       --- Middle-Centered View
        'smithbm2316/centerpad.nvim',
        lazy=true,
        keys = {
            {
                "<leader>cc",
                "<Cmd>Centerpad<CR>",
                mode = "n",
                desc = "Center The Buffer",
            },
        }
    },
    {                                                       --- Python UV Environment
        'benomahony/uv.nvim',
        config = function()
            require('uv').setup()
        end,
    },
    {                                                       --- Syntax Highlighting
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "BufRead *",
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "c", "cmake", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "markdown", "latex", "jsonc", "css", "python" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
}

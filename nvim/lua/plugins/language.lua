return {
    --[[
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "clangd",
                    "neocmake",
                    "arduino_language_server",
                    "html",
                    "ltex",
                    "matlab_ls",
                    "pyright",
                    "bashls",
                    "sqls",
                    "eslint",
                    "volar",
                    "zls",
                },
                automatic_instalation = true,
            }

            require("lspconfig").lua_ls.setup {}
            require("lspconfig").clangd.setup {}
            require("lspconfig").neocmake.setup {}
        end,
    },
    { -- optional cmp completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },]]
}


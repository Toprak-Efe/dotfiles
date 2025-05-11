return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            automatic_installation = true
        }
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
                opts = { library = {{ path = "${3rd}/luv/library", words = { "vim%.uv" } }} }
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            require("mason-lspconfig").setup_handlers {
                function(server)
                    require("lspconfig")[server].setup({
                        capabilities = capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                                workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
                                telemetry = { enable = false }, -- Disable telemetry if you prefer
                            },
                        },
                    })
                end,
                ["pyright"] = function()
                    require("lspconfig").pyright.setup({
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    autoCompleteImports = true,
                                    typeCheckingMode = "strict", -- Can be "off", "basic", or "strict"
                                    reportMissingImports = true, -- Example: enable specific diagnostic reports
                                }
                            }
                        }
                    })
                end,
                ["arduino_language_server"] = function ()
                    require("lspconfig").arduino_language_server.setup({
                        capabilities = capabilities,
                        on_new_config = function(config, root_dir)
                            local DEFAULT_FQBN = "arduino:avr:uno"
                            local determined_fqbn = DEFAULT_FQBN
                            local fqbn_file_path = vim.fs.joinpath(root_dir, ".arduino_fqbn")
                            if vim.fn.filereadable(fqbn_file_path) == 1 then
                                local read_ok, file_content = pcall(function()
                                    local file = io.open(fqbn_file_path, "r")
                                    if not file then return nil end
                                    local content = file:read("*a")
                                    file:close()
                                    return content
                                end)

                                if read_ok and file_content then
                                    local trimmed_fqbn = string.gsub(file_content, "^%s*(.-)%s*$", "%1")
                                    if trimmed_fqbn ~= "" then
                                        determined_fqbn = trimmed_fqbn
                                    end
                                end
                            end
                            config.cmd = {
                                "arduino-language-server",
                                "-fqbn", determined_fqbn
                            }
                        end
                    })
                end
            }
        end,
    },
}


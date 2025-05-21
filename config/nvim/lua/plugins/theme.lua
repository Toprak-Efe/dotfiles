return {
    {                                                               --- Icons
        "echasnovski/mini.icons",
        lazy = true,
        opts = {
            file = {
                [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
                ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
            },
            filetype = {
                dotenv = { glyph = "", hl = "MiniIconsYellow" },
            },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    {
        "folke/noice.nvim",
        opts = {
            cmdline = {
                enabled = true
            },
            routes = {
                view = "notify",
                filter = { event = "msg_showmode" },
            }
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },
    {                                                               --- Bottom Bar
        'echasnovski/mini.statusline',
        opts = {
            set_vim_settings = false,
            content = {
                active = function()
                    local MiniStatusline = require "mini.statusline"
                    local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
                    local git = MiniStatusline.section_git { trunc_width = 40 }
                    local filename = MiniStatusline.section_filename { trunc_width = 140 }
                    local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
                    return MiniStatusline.combine_groups {
                        { hl = mode_hl, strings = { mode:upper() } },
                        { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
                        "%<", -- Mark general truncate point
                        { hl = "MiniStatuslineFilename", strings = { filename } },
                        "%=", -- End left alignment
                        {
                            hl = "MiniStatuslineFileinfo",
                            strings = {
                                vim.bo.filetype ~= ""
                                    and require("mini.icons").get("filetype", vim.bo.filetype) .. " " .. vim.bo.filetype,
                            },
                        },
                        { hl = mode_hl, strings = { "%l:%v" } },
                    }
                end,
            },
        },
    },
    { 
        'kdheepak/monochrome.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "monochrome"
        end
    },
    {"xiyaowong/transparent.nvim"},                                 --- Transparency
    {                                                               --- Markdown Rendering
        'MeanderingProgrammer/render-markdown.nvim',
        event = "BufRead *.md",
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'echasnovski/mini.icons'
        },
        opts = {
            quote = {
                enabled = true,
                render_modes = false,
                icon = '▋',
                repeat_linebreak = true,
            },
        }
    },
}

return {
    {                                                           --- Fuzzy Finder
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        lazy = true,
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            {
                '<leader>ff',
                '<Cmd>Telescope find_files<CR>',
                mode = 'n',
                desc = 'Telescope Find Files'
            },
            {
                '<leader>fg',
                '<Cmd>Telescope git_files<CR>',
                mode = 'n',
                desc = 'Telescope Git Files'
            },
            {
                '<leader>fw',
                '<Cmd>Telescope live_grep<CR>',
                mode = 'n',
                desc = 'Telescope Live Grep'
            }
        }
    },
    {                                                           --- Folder Navigation
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "echasnovski/mini.icons",
            "MunifTanjim/nui.nvim",
        },
        lazy = false,
        keys = {
            {
                '<leader>pv',
                '<Cmd>Neotree focus<CR>',
                mode = 'n',
                desc = 'Focus Neotree',
            }
        },
    },
    {                                                           --- Viewing Images
        'adelarsq/image_preview.nvim',
        event = 'VeryLazy',
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    window = {
                        mappings = {
                            ["<leader>p"] = "image_wezterm", -- " or another map
                        },
                    },
                    commands = {
                        image_wezterm = function(state)
                            local node = state.tree:get_node()
                            if node.type == "file" then
                                require("image_preview").PreviewImage(node.path)
                            end
                        end,
                    },
                },
            })
            require("image_preview").setup()
        end,
    },
}

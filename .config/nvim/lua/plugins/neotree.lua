return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>" },
        },
        config = function()
            require("neo-tree").setup({
                vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal<cr>"),
                popup_border_style = "single",
                window = {
                    mappings = {
                        ["<CR>"] = "open",
                        ["l"] = "open",
                        ["P"] = {
                            "toggle_preview",
                            config = {
                                use_float = false,
                            },
                        },
                    },
                },
                event_handlers = {
                    {
                        event = "file_opened",
                        handler = function(_)
                            require("neo-tree.command").execute({ action = "close" })
                        end,
                    },
                },
            })
        end,
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neo-tree/neo-tree.nvim",
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
}

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>t", "<cmd>Trouble diagnostics<cr>" },
    },
    config = function()
        require("trouble").setup({
            auto_preview = true,
            auto_open = false,
            auto_close = true,
        })
    end,
}

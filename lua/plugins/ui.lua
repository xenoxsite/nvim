return {
    ---@type LazyPluginSpec
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            vim.o.background = "dark" -- or "light" for light mode
            vim.cmd("let g:gruvbox_material_background= 'hard'")
            vim.cmd("let g:gruvbox_material_transparent_background=2")
            vim.cmd("let g:gruvbox_material_diagnostic_line_highlight=1")
            vim.cmd("let g:gruvbox_material_diagnostic_virtual_text='colored'")
            vim.cmd("let g:gruvbox_material_enable_bold=1")
            vim.cmd("let g:gruvbox_material_enable_italic=1")
            vim.cmd("colorscheme gruvbox-material") -- Set color scheme

            -- changing bg and border colors
            vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
            vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
            vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
        end,
    },
    ---@type LazyPluginSpec
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        config = function()
            local fidget = require("fidget")
            fidget.setup({
                notification = {
                    window = {
                        winblend = "0",
                    },
                },
            })
            vim.notify = fidget.notify
        end,
    },

    ---@type LazyPluginSpec
    {
        "folke/which-key.nvim",
        dependencies = {
            "echasnovski/mini.icons",
        },
        config = function()
            local wk = require("which-key")
            wk.setup({
                win = {
                    border = "single",
                },
            })
        end,
    },
}

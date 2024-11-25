return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {
                    config = {
                        icons = {
                            heading = {
                                icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
                            },
                            todo = {
                                undone = {
                                    icon = "X",
                                },
                                done = {
                                    icon = "D",
                                },
                                urgent = {
                                    icon = "I",
                                },
                                cancelled = {
                                    icon = "C",
                                },
                                recurring = {
                                    icon = "R",
                                },
                                uncertain = {
                                    icon = "?",
                                },
                                on_hold = {
                                    icon = "H",
                                },
                                pending = {
                                    icon = "!",
                                },
                            },
                        },
                    },
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
                    },
                },
            },
        })
    end,
}

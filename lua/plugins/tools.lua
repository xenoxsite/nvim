return {
    {
        "akinsho/toggleterm.nvim",
        config = function()
            local toggleterm = require("toggleterm")
            toggleterm.setup({
                size = 12,
                open_mapping = [[<c-\>]],
                shade_filetypes = {},
                run_tmux = false,
                shade_terminal = true,
                shading_factor = 1,
                start_in_insert = true,
                persist_size = true,
                direction = "horizontal",
                autochdir = true,
            })
            local keymap = vim.keymap -- for conciseness
            keymap.set("n", "<C-\\>", ":ToggleTerm<CR>")
            keymap.set("t", "<C-\\>", "<Cmd>ToggleTerm<CR>")
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
        end,
    },
    {
        "CRAG666/code_runner.nvim",
        event = "BufReadPre",
        keys = {
            {
                "<leader>r",
                ":RunCode<CR>",
                "n",
                desc = "Run code",
            },
        },
        config = function()
            local code_runner = require("code_runner")
            code_runner.setup({
                mode = "term",
                startinsert = true,
                filetype = {
                    python = "python3 -u",
                    typescript = "deno run",
                    rust = "cd $dir && cargo run",
                    c =
                    "cd $dir && mkdir -p .bin && cd .bin && gcc --debug ../$fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
                    cpp =
                    "cd $dir && mkdir -p .bin && cd .bin && g++ --debug ../$fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
                },
                project = {},
            })
        end,
    },
    {
        "mg979/vim-visual-multi",
    },
    {
        "xeluxee/competitest.nvim",
        dependencies = { "muniftanjim/nui.nvim", lazy = true },
        cmd = "CompetiTest",
        keys = {
            { "<leader>ca", "<CMD>CompetiTest add_testcase<CR>",    options, desc = "CP: add testcases" },
            { "<leader>ce", "<CMD>CompetiTest edit_testcase<CR>",   options, desc = "CP: edit testcases" },
            { "<leader>cd", "<CMD>CompetiTest delete_testcase<CR>", options, desc = "CP: delete testcases" },
            { "<leader>cr", "<CMD>CompetiTest run<CR>",             options, desc = "CP: run testcases" },
            { "<leader>cp", "<CMD>CompetiTest receive problem<CR>", options, desc = "CP: download testcases" },
            { "<leader>cc", "<CMD>CompetiTest receive contest<CR>", options, desc = "CP: download contest" },
        },
        opts = {
            received_files_extension = "cpp",
            testcases_directory = "./.tests",
            compile_directory = "./.bin",
            running_directory = "./.bin",
            compile_command = {
                cpp = {
                    exec = "clang++", --[[ clang++ | g++ ]]
                    args = {
                        "-std=c++20",
                        "-pedantic",
                        "-O2",
                        "-Wall",
                        "-Wextra",
                        "-Wconversion",
                        "-Wno-sign-conversion",
                        "-Wshadow",
                        "-fsanitize=address,undefined",
                        "../$(FNAME)",
                        "-o",
                        "$(FNOEXT)",
                    },
                },
                c = { exec = "gcc", args = { "-Wall", "-Wextra", "-O2", "../$(FNAME)", "-o", "$(FNOEXT)" } },
            },
            run_command = {
                c = { exec = "./$(FNOEXT)" },
                cpp = { exec = "./$(FNOEXT)" },
            },
        },
    },
    {
        "lostl1ght/lazygit.nvim",
        lazy = true,
        cmd = "Lazygit",
        keys = { { "<leader>g", "<cmd>Lazygit<cr>", desc = "Git" } },
    },
    {
        "willothy/flatten.nvim",
        config = function()
            require("flatten").setup({
                window = { open = "smart" },
                callbacks = {
                    pre_open = vim.schedule_wrap(function()
                        require("lazygit").hide()
                    end),
                    block_end = vim.schedule_wrap(function()
                        require("lazygit").show()
                    end),
                },
            })
        end,
        lazy = false,
        priority = 1001,
    },
    {
        "IogaMaster/neocord",
        event = "VeryLazy",
        config = function()
            require("neocord").setup()
        end,
    },
}

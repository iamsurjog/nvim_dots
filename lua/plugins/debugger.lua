return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "jay-babu/mason-nvim-dap.nvim",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
        local mason_dap = require("mason-nvim-dap")
        local dap = require("dap")
        local ui = require("dapui")
        local dap_virtual_text = require("nvim-dap-virtual-text")
        dap_virtual_text.setup()

        mason_dap.setup({
            ensure_installed = { "cppdbg", "debugpy", "delve"},
            automatic_installation = true,
            handlers = {
                function(config)
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        })

        -- Configurations
        dap.configurations = {
            c = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = false,
                    MIMode = "lldb",
                },
                {
                    name = "Attach to lldbserver :1234",
                    type = "cppdbg",
                    request = "launch",
                    MIMode = "lldb",
                    miDebuggerServerAddress = "localhost:1234",
                    miDebuggerPath = "/usr/bin/lldb",
                    cwd = "${workspaceFolder}",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                },
            },
            python = { -- New Python configs added here
                {
                    name = "Launch file",
                    type = "python",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to Python script: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    pythonPath = function()
                        local cwd = vim.fn.getcwd()
                        if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                            return cwd .. "/venv/bin/python"
                        elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                            return cwd .. "/.venv/bin/python"
                        else
                            return "/usr/bin/python3" -- Use python3 for most systems
                        end
                    end,
                    cwd = "${workspaceFolder}",
                },
                {
                    name = "Attach to debugpy :5678",
                    type = "python",
                    request = "attach",
                    connect = {
                        host = "localhost",
                        port = "5678"
                    },
                    cwd = "${workspaceFolder}",
                    pathMapping = {
                        ["/"] = "${workspaceFolder}"
                    },
                },
            },
            -- TODO: Figure GO debugger
            go = {
                {
                    name = "Launch file",
                    type = "delve",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                },
                {
                    name = "Attach to delve :1234",
                    type = "delve",
                    request = "attach",
                    miMode = "legacy",
                    miDebuggerPath = vim.fn.executable("dlv") == 1 and "dlv" or "mason/bin/dlv", -- Uses mason-installed dlv
                    miDebuggerArgs = {
                        "dap",
                        "-l", "localhost:1234",
                    },
                    cwd = "${workspaceFolder}",
                    processId = require('dap.utils').pick_process,
                },
            },
        }

        -- Dap UI

        ui.setup()

        vim.fn.sign_define("DapBreakpoint", { text = "🔴" })

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
    keys = {
        -- Debugger
        {
            "<leader>d",
            group = "Debugger",
            nowait = true,
            remap = false,
        },
        {
            "<leader>dt",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle Breakpoint",
            nowait = true,
            remap = false,
        },
        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            desc = "Continue",
            nowait = true,
            remap = false,
        },
        {
            "<leader>di",
            function()
                require("dap").step_into()
            end,
            desc = "Step Into",
            nowait = true,
            remap = false,
        },
        {
            "<leader>do",
            function()
                require("dap").step_over()
            end,
            desc = "Step Over",
            nowait = true,
            remap = false,
        },
        {
            "<leader>du",
            function()
                require("dap").step_out()
            end,
            desc = "Step Out",
            nowait = true,
            remap = false,
        },
        {
            "<leader>dr",
            function()
                require("dap").repl.open()
            end,
            desc = "Open REPL",
            nowait = true,
            remap = false,
        },
        {
            "<leader>dl",
            function()
                require("dap").run_last()
            end,
            desc = "Run Last",
            nowait = true,
            remap = false,
        },
        {
            "<leader>dq",
            function()
                require("dap").terminate()
                require("dapui").close()
                require("nvim-dap-virtual-text").toggle()
            end,
            desc = "Terminate",
            nowait = true,
            remap = false,
        },
        {
            "<leader>db",
            function()
                require("dap").list_breakpoints()
            end,
            desc = "List Breakpoints",
            nowait = true,
            remap = false,
        },
        {
            "<leader>de",
            function()
                require("dap").set_exception_breakpoints({ "all" })
            end,
            desc = "Set Exception Breakpoints",
            nowait = true,
            remap = false,
        },
    }
}

local present, dap = pcall(require, "dap")
if not present then
    return
end

local pm = require("plugins.mappings").dap

local dap_icons = {
    breakpoint = {
        text = "",
        texthl = "LspDiagnosticsSignError",
        linehl = "",
        numhl = "",
    },
    breakpoint_rejected = {
        text = "",
        texthl = "LspDiagnosticsSignHint",
        linehl = "",
        numhl = "",
    },
    stopped = {
        text = "",
        texthl = "LspDiagnosticsSignInformation",
        linehl = "DiagnosticUnderlineInfo",
        numhl = "LspDiagnosticsSignInformation",
    }
}
vim.fn.sign_define("DapBreakpoint", dap_icons.breakpoint)
vim.fn.sign_define("DapBreakpointRejected", dap_icons.breakpoint_rejected)
vim.fn.sign_define("DapStopped", dap_icons.stopped) 

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", pm.toggle_breakpoint, ":lua require('dap').toggle_breakpoint() <CR>", opts)
map("n", pm.start_and_continue, ":lua require('dap').continue() <CR>", opts)
map("n", pm.step_over, ":lua require('dap').step_over() <CR>", opts)
map("n", pm.step_into, ":lua require('dap').step_into() <CR>", opts)
map("n", pm.step_out, ":lua require('dap').step_out() <CR>", opts)

dap.adapters.python = {
    type = "executable";
    command = "/usr/sbin/python";
    args = { "-m", "debugpy.adapter" };
}

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = "python"; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch";
        name = "Launch file";

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}"; -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                return cwd .. "/.venv/bin/python"
            else
                return "/usr/bin/python"
            end
        end;
    },
}


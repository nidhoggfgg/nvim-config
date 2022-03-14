local present, dapui = pcall(require, "dapui")
if not present then
    return
end

dapui.setup {}

local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
    vim.api.nvim_command("NvimTreeClose")
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

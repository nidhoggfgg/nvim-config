local present, escape = pcall(require, "better_escape")
if not present then
    return
end

local pm = require("plugins.mappings").better_escape
escape.setup {
    mapping = pm.esc_insert,
    timeout = 300,
    clear_empty_lines = false,
    keys = "<Esc>"
}


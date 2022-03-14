local core_modules = {
    "core.mappings",
    "core.options",
    "core.autocmds",
}

for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("load " .. module .. "fail!\n" .. err .. "\n\n")
    end
end


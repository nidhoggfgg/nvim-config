local to_load = {
    "core",
    "plugins"
}

for _, module in ipairs(to_load) do
    local ok, err = pcall(require, module)
    if not ok then
        error("load " .. module .. "fail!\n" .. err .. "\n\n")
    end
end



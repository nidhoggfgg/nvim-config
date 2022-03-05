local present, lspconfig = pcall(require, "lspconfig")
if not present then
    return
end

local pm = require("plugins.mappings").lspconfig
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", pm.goto_declaration, "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", pm.goto_definition, "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", pm.hover, "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", pm.goto_impl, "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", pm.sign_help, "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", pm.add_workspace_folder, "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", pm.remove_workspace_folder, "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", pm.workspace_list, "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", pm.type_definition, "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", pm.rename, "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", pm.code_action, "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", pm.references, "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", pm.show_line_diagnostics, "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", pm.diagnostic_goto_prev, "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", pm.diagnostic_goto_next, "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", pm.diagnostic_set_locline, "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", pm.formatting, "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}

local servers = { "clangd", "rust_analyzer" }
for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150,
        }
    }
end

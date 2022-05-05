local lsp_installer = require("nvim-lsp-installer")

-- configs of servers
local servers = {
    sumneko_lua = require("lsp.servers.sumneko_lua"),
    pyright = require("lsp.servers.pyright")
}

-- auto-install servers
for server_name, _ in pairs(servers) do
    local is_found, server = lsp_installer.get_server(server_name)
    if is_found and (not server:is_installed()) then
        print("Installing LSP server: " .. name)
        server:install()
    end
end

-- nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_keymap = require('keymap').lsp_keymap

local function on_attach(client, bufnr)
    lsp_keymap(bufnr)
    vim.api.nvim_exec(
    [[
    au CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    au CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
    au CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    ]], false)
end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local config = servers[server.name]
    if (config ~= nil) then
        config.on_attach = on_attach
        config.capabilities = capabilities
        server:setup(config)
    else
        server:setup({ on_attach=on_attach, capabilities=capabilities })
    end

    -- local opts = {}
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    -- server:setup(opts)
end)



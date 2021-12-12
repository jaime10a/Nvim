--Setting Up the Language servers for the built in LSP
--the Plugin lsp-config is needed for this
--the language servers need to be installed on the system

require'lspconfig'.pyright.setup{}

require'lspconfig'.html.setup{}

require'lspconfig'.texlab.setup{}

require'lspconfig'.clangd.setup{}

require'lspconfig'.dartls.setup{cmd = { "dart", "/opt/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },}

require'lspconfig'.rust_analyzer.setup{}



--LuaConfig
local sumneko_root_path = '/opt/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

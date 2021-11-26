--Setting Up the Language servers for the built in LSP
--the Plugin lsp-config is needed for this
--the language servers need to be installed on the system

require'lspconfig'.pyright.setup{}

require'lspconfig'.html.setup{}

require'lspconfig'.texlab.setup{}

require'lspconfig'.clangd.setup{}

require'lspconfig'.dartls.setup{cmd = { "dart", "/opt/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },}

--require'lspconfig'.sumneko_lua.setup{}

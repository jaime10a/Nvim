--Setting Up the Language servers for the built in LSP
--the Plugin lsp-config is needed for this
--the language servers need to be installed on the system

require'lspconfig'.pyright.setup{}

require'lspconfig'.html.setup{}

require'lspconfig'.texlab.setup{}

require'lspconfig'.clangd.setup{}

require'lspconfig'.rust_analyzer.setup{}

require'lspconfig'.gopls.setup{}

require'lspconfig'.lua_ls.setup{}

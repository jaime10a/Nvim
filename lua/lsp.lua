--Setting Up the Language servers for the built in LSP
--the Plugin lsp-config is needed for this
--the language servers need to be installed on the system

require'lspconfig'.pyright.setup{}

require'lspconfig'.html.setup{}

require'lspconfig'.texlab.setup{}

require'lspconfig'.clangd.setup{}

--require'lspconfig'.sumneko_lua.setup{}

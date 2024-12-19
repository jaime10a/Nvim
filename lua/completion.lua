-- return {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--     dependencies = {
--         -- Snippet Engine & its associated nvim-cmp source
--         {
--             "L3MON4D3/LuaSnip",
--             build = "make install_jsregexp",
--         },
--         "saadparwaiz1/cmp_luasnip",
--
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-path",
--         "hrsh7th/cmp-buffer",
--         "hrsh7th/cmp-nvim-lua",
--         "hrsh7th/cmp-cmdline",
--         "hrsh7th/vim-vsnip",
--
--         "rafamadriz/friendly-snippets",
--     },
--     -- config = require('completion')
--     config = function()
--         local cmp = require("cmp")
--         local luasnip = require("luasnip")
--         luasnip.config.setup({})
--
--         cmp.setup({
--             snippet = {
--                 expand = function(args)
--                     luasnip.lsp_expand(args.body)
--                 end,
--             },
--             completion = { completeopt = "menu,menuone,noinsert" },
--             mapping = cmp.mapping.preset.insert({
--                 ["<C-n>"] = cmp.mapping.select_next_item(),
--                 ["<C-p>"] = cmp.mapping.select_prev_item(),
--                 ["<C-y>"] = cmp.mapping.confirm({ select = true }),
--                 -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
--                 ["<C-Space>"] = cmp.mapping.complete({}),
--                 -- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
--                 -- ["<C-d>"] = cmp.mapping.scroll_docs(4),
--                 ["<C-e>"] = cmp.mapping.abort(),
--
--                 -- Think of <c-l> as moving to the right of your snippet expansion.
--                 --  So if you have a snippet that's like:
--                 --  function $name($args)
--                 --    $body
--                 --  end
--                 -- <c-l> will move you to the right of each of the expansion locations.
--                 -- <c-h> is similar, except moving you backwards.
--                 -- TODO: this mapping has to change/ not working
--                 ["<C-d>"] = cmp.mapping(function()
--                     if luasnip.expand_or_locally_jumpable() then
--                         luasnip.expand_or_jump()
--                     end
--                 end, { "i", "s" }),
--                 ["<C-u>"] = cmp.mapping(function()
--                     if luasnip.locally_jumpable(-1) then
--                         luasnip.jump(-1)
--                     end
--                 end, { "i", "s" }),
--             }),
--             sources = {
--                 { name = "nvim_lsp" },
--                 { name = "luasnip" },
--                 { name = "path" },
--                 { name = "buffer",  keyword_length = 5 },
--             },
--             experimental = {
--                 ghost_text = false,
--             },
--         })
--         -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--         cmp.setup.cmdline({ "/", "?" }, {
--             mapping = cmp.mapping.preset.cmdline(),
--             sources = {
--                 { name = "buffer" },
--             },
--         })
--
--         -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--         cmp.setup.cmdline(":", {
--             mapping = cmp.mapping.preset.cmdline(),
--             sources = cmp.config.sources({
--                 { name = "path" },
--             }, {
--                 { name = "cmdline" },
--             }),
--         })
--     end,
-- }
--blink.cmp Completion
return
{
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = 'rafamadriz/friendly-snippets',

  -- use a release tag to download pre-built binaries
  version = 'v0.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },
    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      -- optionally disable cmdline completions
      -- cmdline = {},
    },

    -- experimental signature help support
    -- signature = { enabled = true }
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { "sources.default" }
}

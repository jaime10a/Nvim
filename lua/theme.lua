--SetTheme
--require('gruvbox-material').setup()
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
vim.api.nvim_command "colorscheme catppuccin"
-- vim.api.nvim_command "colorscheme duskfox"

--LuaLine Config
require('lualine').setup {
  options = {
    theme = 'auto',
    extensions = {'nvim-tree'}
  }
}


function ColorMyPencils() --function from the Primeagen to color things
    vim.opt.background = "dark"

    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end

    hl("SignColumn", {
        bg = "none",
    })
    hl("Normal", { -- makes background transparent
        bg = "none"
    })
end
ColorMyPencils()

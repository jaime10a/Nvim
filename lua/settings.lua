local o = vim.o  -- For the globals options
local w = vim.wo -- For the window local options
local b = vim.bo -- For the buffer local options

--Side Numbers
w.relativenumber = true
w.number = true

--Clipboard works with system
o.clipboard = "unnamedplus"

--Indentation
b.autoindent = true
b.expandtab = true
b.softtabstop = 4
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true

--Lazyredraw
o.lazyredraw = true

--Split down with :split and right with :vsplit
o.splitbelow = true
o.splitright = true

--Wrapping off
w.wrap = false

--Lines above and below the cursor
o.scrolloff = 4

--Mouse also works
o.mouse ='a'

vim.highlight.on_yank = true



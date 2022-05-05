-- utf8

-- env
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 2

-- cursor highlight
vim.o.updatetime = 300
vim.o.cursorline = true

-- split window
--vim.o.splitright = true

-- line number
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'

-- line wrapping
vim.o.wrap = true

-- tabstop
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true


--[[
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = "<,>,[,]"

-- 永远显示 tabline
vim.o.showtabline = 2

-- 使用增强状态栏插件后不再需要 vim 的模式提示
--
vim.o.showmode = false
--]]

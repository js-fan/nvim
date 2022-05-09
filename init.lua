
--[[
possibly useful plugins
https://github.com/phaazon/hop.nvim
https://github.com/simrat39/symbols-outline.nvim

--]]

require('basic')
require('plugins')
require('lsp.init')  -- lsp
require('nvim-cmp')  -- completation
require('keymap').setup()

-- themes
local themes = require('themes')
-- themes.set_onedark('darker')
-- themes.set_nordfox('nordfox')
themes.set_sonokai('atlantis')



require('lualine').setup {
    tabline = {
        lualine_a = {},
        lualine_b = {'buffers'},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {'tabs'},
        lualine_z = {}
    }
}
vim.api.nvim_exec(
[[
hi LspReferenceText gui=inverse
hi LspReferenceRead gui=inverse
hi LspReferenceWrite gui=inverse
]], false)

-- indent line
-- require("indent_blankline").setup { char = "🐼" }
vim.g.indent_blankline_show_first_indent_level = false

-- float terminal size
vim.g.floaterm_height = 0.7
vim.g.floaterm_width = 0.7

-- treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "cpp", "cuda", "java", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


-- require('keymap')
-- require('plugins')
-- 
-- -- themes
-- -- 'projekt0n/github-nvim-theme'
-- -- require('github-theme').setup({
-- --   theme_style = 'dark',
-- --   function_style = 'italic',
-- -- })
-- -- 'navarasu/onedark.nvim'
-- require('onedark').load()
-- 
-- 
-- -- nvim-tree
-- require('nvim-tree').setup({
--   view = {
--     mappings = {
--       list = {
--         {key = 's', action = 'vsplit'},
--         {key = 't', action = 'tabnew'},
--       }}
--   }
-- })
-- 
-- 
-- -- lsp
-- require('lsp.init')
-- require('nvim-cmp')

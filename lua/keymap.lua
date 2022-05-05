-- leader keys

local opts = { noremap=true, silent=true }

local keymap_funcs = {}
-- common setting
function keymap_funcs.setup()
  vim.g.mapleader = ";"
  vim.g.maplocalleader = ";"
  
  -- jump between split windows
  vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
  vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
  vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
  vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)

  -- jump code
  vim.api.nvim_set_keymap('n', 'gb', '<C-t>', opts)

  -- save, quit
  vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', opts)

  -- switch buffer
  vim.api.nvim_set_keymap('n', '<Tab>', ':bn<CR>', opts)
  vim.api.nvim_set_keymap('n', '<S-Tab>', ':bp<CR>', opts)
  
  -- nvim-tree
  -- vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', opts)
  -- neo-tree
  -- vim.api.nvim_set_keymap('n', '<leader>t', ':Neotree filesystem left<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>t', ':Neotree filesystem float<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>b', ':Neotree buffers float<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>g', ':Neotree git_status float<CR>', opts)
  require('neo-tree').setup({window={mappings={['o']='open'}}})

  vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
  require('telescope').load_extension 'file_browser'

  -- float terminal
  vim.api.nvim_set_keymap('n', '<leader>s', ':FloatermToggle<CR>', opts)
  vim.api.nvim_set_keymap('t', '<leader>s', '<C-\\><C-n>:FloatermToggle<CR>', opts)

  --vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', opts)
  --vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', opts)
  --vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', opts)
  --vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', opts)
  vim.api.nvim_set_keymap('t', '<C-\\>n', '<C-\\><C-n>:FloatermNext<CR>', opts)
  vim.api.nvim_set_keymap('t', '<C-\\>p', '<C-\\><C-n>:FloatermPrev<CR>', opts)
  

  -- indent line
  vim.api.nvim_set_keymap('n', '<leader>i', ':IndentBlanklineToggle<CR>', opts)

end



-- lsp
function keymap_funcs.lsp_keymap(bufnr)
  -- Enable completion triggered by <c-x><c-o>
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end


return keymap_funcs

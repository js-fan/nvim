
local themes = {}

themes.themes = {
    -- onedark themes
    'dark', 'darker', 'cool', 'deep', 'warm', 'warmer',
    -- nordfox themes
    'nightfox', 'dayfox', 'dawnfox', 'duskfox', 'nordfox', 'terafox',
    -- sonokai themes
    'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso',
}

-- onedark themes
function themes.set_onedark(name)
    require('onedark').setup {
        style = name
    }
    require('onedark').load()
end

-- nordfox themes
function themes.set_nordfox(name)
    vim.cmd('colorscheme ' .. name)
end

-- everforest themes
function themes.set_everforest(name)
    if (name == 'everforest-soft') then
        vim.g.everforest_background = 'soft'
    elseif (name == 'everforest-hard') then
        vim.g.everforest_background = 'hard'
    elseif (name == 'everforest-medium') then
        vim.g.everforest_background = 'medium'
    end
    vim.cmd('colorscheme ' .. 'everforest')
end


-- PaperColor themes
function themes.set_papercolor(name)
    vim.cmd('colorscheme ' .. 'PaperColor')
end

-- sonokai themes
function themes.set_sonokai(name)
    vim.g.sonokai_style = name
    vim.g.sonokai_better_performance = 1
    vim.cmd('colorscheme ' .. 'sonokai')
end

return themes

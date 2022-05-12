
local themes = {}

themes.themes = {
    -- onedark themes
    'dark', 'darker', 'cool', 'deep', 'warm', 'warmer',
    -- nordfox themes
    'nightfox', 'dayfox', 'dawnfox', 'duskfox', 'nordfox', 'terafox',
    -- sonokai themes
    'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso',
    --everforest
    'everforest',
    -- papercolor
    'papercolor',
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


function themes.set(name)
    for _, target in ipairs {
        'dark', 'darker', 'cool', 'deep', 'warm', 'warmer',
    } do
        if (name == target) then
            themes.set_onedark(name)
        end
    end

    for _, target in ipairs {
        'nightfox', 'dayfox', 'dawnfox', 'duskfox', 'nordfox', 'terafox',
    } do
        if (name == target) then
            themes.set_nordfox(name)
        end
    end

    for _, target in ipairs {
        'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso',
    } do
        if (name == target) then
            themes.set_sonokai(name)
        end
    end

    if (name == 'everforest') then
        themes.set_everforest('everforest-medium')
    elseif (name == 'papercolor') then
        themes.set_papercolor('')
    end

    vim.api.nvim_exec(
    [[
    hi LspReferenceText gui=inverse
    hi LspReferenceRead gui=inverse
    hi LspReferenceWrite gui=inverse
    ]], false)
end


function themes.init() 
    vim.api.nvim_create_user_command('Theme', 
        'lua require("themes").set(<q-args>)',
        {
            nargs = 1,
            complete = function(ArgLead, CmdLine, CursorPos)
                return themes.themes
            end
    })
end

return themes

--[[ file: md-includes.lua

    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license
    You should have received a copy of the license along with this software.
    If not, see <https://opensource.org/licenses/MIT>

    Substitues image links to a pandoc md file with the contents of the file, rendered.
    Uses it as long as it has an attribute of file=anything.
    But the link element **has** to be inside a Para block, meaning it has to be
    surrounded by blank lines.
--]]

local function initInclude(p)
    if #p.content == 1 and p.content[1].t == "Image" then
        local image = p.content[1]
        if image.attributes["file"] then
            io.input(image.src)
            -- let pandoc parse the file, get only the content, not the metadata.
            return pandoc.read(io.read("all")).blocks
        end
    end
end

local function laterIncludes(block)
    -- map doesn't work. TODO: list splicing and a for loop.
    if block.t == "Para" then
        if #block.content == 1 and block.content[1].t == "Image" then
            local image = block.content[1]
            if image.attributes["file"] then
                io.input(image.src)
                -- let pandoc parse the file, get only the content, not the metadata.
                return pandoc.read(io.read("all")).blocks
            end
        end
    end
    return block
end

return {
    {
        Para = function(elem)
            local first = initInclude(elem)
            return first
            -- if type(first) == "table" then
            --     second = first:map(laterIncludes)
            --     pr.dump(second[4][1].t)
            -- end
        end,
    }
}

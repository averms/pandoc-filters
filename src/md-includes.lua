--[[ file: md-includes.lua

    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license
    See https://github.com/aaether32323/pandoc-filters/raw/master/LICENSE for details.

    Substitues image links to *.md with the contents of the file, rendered.
    Abuses the link element. Uses it as long as it has an attribute of file=anything.
    But the link element **has** to be inside a Para block, meaning it has to be
    surrounded by blanks.
--]]
local ins = require "inspect"

local function endsWith(s, suffix)
    if #s >= #suffix then
        return find(s, suffix, #s-#suffix+1, true)
    end
    return false
end

return {
    {
        Para = function(p)
            if #p.content == 1 and p.content[1].t == "Image" then
                local image = p.content[1]
                if image.attributes["file"] then
                    io.input(image.src)
                    -- let pandoc parse the file, get only the content, not the metadata.
                    return pandoc.read(io.read("all")).blocks
                end
            end
        end
    }
}

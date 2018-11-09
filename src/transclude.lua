--[[ file: transclude.lua

    m4_include(cr.txt)m4_dnl

    Substitues image links to a pandoc md file with the contents of the file, rendered.
    Uses it as long as it has an attribute of file=anything.
    But the link element **has** to be inside a Para block, meaning it has to be
    surrounded by blank lines.
--]]
local pr = require("pl.pretty")

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

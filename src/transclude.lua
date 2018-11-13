--[[ file: transclude.lua

    m4_include(cr.txt)m4_dnl

    Substitues image links to a pandoc md file with the contents of the file, rendered.
    Uses it as long as it has an attribute of file=anything.
    But the link element **has** to be inside a Para block, meaning it has to be
    surrounded by blank lines.
--]]
local pr = require("pl.pretty")

local function transclude(p)
    if #p.content == 1 and p.content[1].t == "Span" then
        local span = p.content[1]
        if span.attributes["inc"] then
            io.input(pandoc.utils.stringify(span.content))
            -- let pandoc parse the file, wrap the content in a Div
            local parsed_div = pandoc.Div(pandoc.read(io.read("all")).blocks)
            return pandoc.walk_block(parsed_div, {Para = transclude}).content
        end
    end
end
return {
    {
        Para = function(p)
            return transclude(p)
        end,
    }
}

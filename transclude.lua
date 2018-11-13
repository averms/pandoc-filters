--[[ file: transclude.lua

    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license
    You should have received a copy of the license along with this software.
    If not, see <https://opensource.org/licenses/MIT>

    Substitues image links to a pandoc md file with the contents of the file, rendered.
    Uses it as long as it has an attribute of file=anything.
    But the link element **has** to be inside a Para block, meaning it has to be
    surrounded by blank lines.
--]]

local function transclude(p)
    if #p.content == 1 and p.content[1].t == "Image" then
        local image = p.content[1]
        if image.attributes["file"] then
            io.input(image.src)
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

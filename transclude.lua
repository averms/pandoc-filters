--[[ transclude

    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license
    You should have received a copy of the license along with this software.
    If not, see <https://opensource.org/licenses/MIT>

    Substitues span containing a file name with the contents of the file, rendered.
    But the span element has to be inside a Para block, meaning it has to be
    surrounded by blank lines.
--]]

-- Function needs to have a name so that recursion can work.
-- That is why it is outside the returned table.
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
        Para = transclude
    }
}

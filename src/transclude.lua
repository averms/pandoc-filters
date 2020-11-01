--- transclude: recursively include other files
-- © 2020 Aman Verma. Distributed under the MIT license.

-- Function needs to have a name so that recurion can work.
-- That is why it is outside the returned table.
local function transclude(p)
  if #p.content == 1 and p.content[1].t == 'Span' then
    local span = p.content[1]
    if span.attributes['inc'] then
      io.input(pandoc.utils.stringify(span.content))
      -- let pandoc parse the file, wrap the content in a Div
      local parsed_div = pandoc.Div(pandoc.read(io.read('a')).blocks)
      return pandoc.walk_block(parsed_div, {Para = transclude}).content
    end
  end
end

return {
  {
    Para = transclude
  }
}

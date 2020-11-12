--- oldschool: render a plain text file with fancy ASCII formatting
-- © 2020 Aman Verma. Distributed under the MIT license.

-- Format is commonmark_x
-- What do we want to do?
-- [x] Code blocks should only be indented and not have any language stuff.
-- [ ] Italic should have underlines.
-- [ ] Nice table syntax similar to Pandoc simple_tables.
-- [ ] Headers 3 and 4 and 5 should have underline.

return {
  {
    CodeBlock = function(elem)
      elem.attr = nil
      return elem
    end

    -- Emph = function(elem)
    -- end

    -- Meta = function(m)
    --   local title, underline = setext(m.title, underchars[0])
    --   m.title = pandoc.MetaInlines{
    --     pandoc.RawInline('plain', text.upper(title)),
    --     pandoc.LineBreak(),
    --     pandoc.RawInline('plain', underline),
    --   }
    --   return m
    -- end,
  }
}

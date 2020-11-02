--- code-includes: include code from a separate file
-- © 2020 Aman Verma. Distributed under the MIT license.

local function readPopulatedLines(fpth)
  io.input(fpth)
  local contents = io.read('a')
  -- Unix text editors save files with a newline at the end.
  -- This is not useful to us so we strip it.
  contents = contents:gsub("\n$", '')
  return contents
end

return {
  {
    CodeBlock = function(elem)
      if not elem.attributes['inc'] then
        return nil
      end

      -- Strip all whitespace around the text.
      filename = elem.text:match('^%s*(.-)%s*$')
      -- Remove the inc attribute so it doesn't show up in output.
      elem.attributes['inc'] = nil
      if filename == '' then
        io.stderr:write('There was no filename inside the code block.')
        return nil
      end
      elem.text = readPopulatedLines(filename)
      return elem
    end
  }
}

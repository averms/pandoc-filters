--- code-includes
-- Substitues code blocks containing `inc` attributes with the file inside.

-- helper funcs
local function readPopulatedLines(fpth)
  io.input(fpth)
  local contents = io.read("a")
  -- Unix text editors save files with a newline at the end.
  -- This is not useful to us so we strip it.
  contents = contents:gsub("%s+$", "")
  return contents
end

return {
  {
    CodeBlock = function(cb)
      if cb.attributes["inc"] then
        -- strip all whitespace around the text
        filename = cb.text:match("^%s*(.-)%s*$")

        if filename == "" then
          io.stderr:write("There was no filename inside the code block.")
          return cb
        end

        cb.text = readPopulatedLines(filename)
      end
      return cb
    end,
  }
}

--[[ code-includes.lua

    m4_include(cr.txt)m4_dnl

    Substitues code blocks containing `inc` attributes with the file inside.
--]]
local pr = require("pl.pretty")

-- helper funcs
local function readPopulatedLines(fpth)
    io.input(fpth)
    local contents = io.read("a")
    -- Sometimes, people put an empty line at the end of their source files
    -- because their linter tells them to. This does not look good in markdown.
    -- So, we strip the end
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
                    io.stderr:write("There was no filename inside the code block or the regex messed up.")
                    return cb
                end

                cb.text = readPopulatedLines(filename)
            end
            return cb
        end,
    }
}


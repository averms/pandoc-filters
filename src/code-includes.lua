--[[ file: code-includes.lua

    m4_include(cr.txt)
    Substitues code blocks containing `file` attributes with the file inside.
--]]
local pr = require("pl.pretty")

-- helper funcs
local function readPopulatedLines(fpth)
    io.input(fpth)
    local contents = io.read("all")
    -- Sometimes, people put an empty line at the end of their source files
    -- because their linter tells them to. This does not look good in markdown.
    -- So, we strip the end of string
    contents = contents:gsub("%s+$", "")
    return contents
end

return {
    {
        CodeBlock = function(cb)
            if cb.attributes["file"] then
                -- strip all whitespace around the text
                filename = cb.text:match("^%s*(.-)%s*$")
                cb.text = readPopulatedLines(filename)
            end
            return cb
        end,
    }
}


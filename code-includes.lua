--[[ file: code-includes.lua

    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license
    You should have received a copy of the license along with this software.
    If not, see <https://opensource.org/licenses/MIT>

    Substitues code blocks containing `file` attributes with the file inside.
--]]

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


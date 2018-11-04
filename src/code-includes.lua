--[[ file: code-includes.lua

    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license
    You should have received a copy of the license along with this software.
    If not, see <https://opensource.org/licenses/MIT>

    Substitues code blocks containing `file` attributes with the file inside.
--]]
local inspect = require("inspect")

-- helper funcs
local function readPopulatedLines(fpth)
    io.input(fpth)
    local contents = io.read("all")
    -- strip end of string
    contents = contents:gsub("%s+$", "")
    return contents
end

-- table to return to pandoc
return {
    {
        CodeBlock = function(cb)
            if cb.attributes["file"] then
                filename = cb.text:match("^%s*(.-)%s*$")
                cb.text = readPopulatedLines(filename)
            end
            return cb
        end,
    }
}


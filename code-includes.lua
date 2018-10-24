--[[ file: code-includes.lua

    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license
    See https://github.com/aaether32323/pandoc-filters/raw/master/LICENSE

    Substitues code blocks containing `file` attributes with the file inside.
--]]

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


--[[ file: code-includes.lua

    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license (see LICENSE for details)
    Substitues code blocks containing `include` attributes with the included file.
--]]
local inspect = require("inspect")

-- helper funcs
function readit()
    -- return contents of global var `filename` and close the file
    local file = io.open(filename, 'r')
    local contents = file:read("*all")
    file:close()
    -- strip end of string
    contents = contents:gsub("%s+$", "")
    return contents
end

-- table to return to pandoc
return {
    {
        CodeBlock = function(cb)
            if cb.attributes["file"] then
                filename = cb.attributes["file"]
                local succeeded, content = pcall(readit)
                if succeeded then
                    cb.text = readit(content)
                else
                    print("E: file not found " .. filename)
                end
            end
            return cb
        end,
    }
}


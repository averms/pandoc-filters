--[[ file: code-includes.lua

    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license (see LICENSE for details)
    Substitues code blocks containing `include` attributes with the included file.
--]]

function readit(filename)
    -- return contents of file and close the file
    local file = io.open(filename, 'r')
    local contents = file:read("*all")
    file:close()
    return contents
end

return {
    {
        CodeBlock = function(cb)
            if cb.attributes["include"] then
                local filename = cb.attributes["include"]
                cb.text = readit(filename)
            end
            return cb
        end,
    }
}


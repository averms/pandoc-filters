-- file: code-includes.lua
-- Substitute files inside code blocks

function readit(filename)
    -- read contents of file
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


--[[ file: standard-code.lua
   
    m4_include(cr.txt)m4_dnl

    Turns <pre class="*"><code> into <pre><code class="language-*".
    Throws away all attributes, so it should come after any filters that use attributes.
--]]

local pr = require("pl.pretty")

m4_include(languages.txt)m4_dnl

local function checkClassIsLanguage(name)
    -- name: string
    -- returns: index of the programming language if found or -1 if not found.
    for i, val in ipairs(languages) do
        if val == name then
            return i
        end
    end
    return -1
end

local function getCodeClass(classes)
    -- check if classes includes a programming language name. Side effect is that it
    -- removes the class that matches from the `classes` table
    -- classes: table[string]
    -- returns: Valid class attr using first match (with a space at beginning).
    --          or empty string if no classes match a programming language name.
    local classIndex = -1

    for i, cl in ipairs(classes) do
        classIndex = checkClassIsLanguage(cl)
        if classIndex ~= -1 then
            return ' class="language-' .. table.remove(classes, i) .. '"'
        end
    end
    return ""
end

local function makeIdentifier(ident)
    -- ident: string
    -- returns: valid id attr (with a space at the beginning) OR empty string
    if #ident ~= 0 then
        return ' id="'.. ident .. '"'
    else
        return ""
    end
end

local function makeClasses(classes)
    -- classes: table
    -- returns: valid class attr with classes separated by spaces (with a space at the beginning) 
    --          OR empty string.
    if #classes ~= 0 then
        return ' class="' .. table.concat(classes, " ") .. '"'
    else
        return ""
    end
end

return {
    {
        CodeBlock = function(p)
            if not FORMAT == "html5" then
                return p
            end

            id = makeIdentifier(p.identifier)
            classLang = getCodeClass(p.classes)
            classReg = makeClasses(p.classes)

            local pre_code = string.format('<pre%s%s><code%s>%s</code></pre>',
                id, classReg, classLang, p.text)
            return pandoc.RawBlock("html5", pre_code ,"RawBlock")
        end,

    }
}

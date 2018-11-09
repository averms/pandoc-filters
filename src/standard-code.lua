--[[ file: standard-code.lua
   
    m4_include(cr.txt)
    Turns <pre class="*"><code> into <pre><code class="language-*".
    Throws away all attributes, so it should come after any filters that use attributes.
--]]

local pr = require("pl.pretty")

m4_include(languages.txt)

return {
    {
        CodeBlock = function(p)
            if not FORMAT == "html5" then
                return p
            end
            local preCode = string.format('<pre id="%s"><code class="language-%s">%s</code></pre>',
                p.identifier, table.concat(p.classes, " "), p.text)
            return pandoc.RawBlock("html5", preCode ,"RawBlock")
        end,

    }
}

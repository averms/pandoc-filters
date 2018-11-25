--[[ tikz.lua
   
    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license
    You should have received a copy of the license along with this software.
    If not, see <https://opensource.org/licenses/MIT>
    
    Converts code blocks with class = tikz. to png?
--]]

tex_path = os.tmpname() .. ".tex"
dvi_path = os.tmpname() .. ".dvi"
print(tex_path)
print(dvi_path)

local function makeDvi(tikz_code)
    local full_doc = "\\documentclass{standalone}\n"
                  .. "\\usepackage{tikz}\n"
                  .. "\\begin{document}\n"
                  .. tikz_code .. "\n"
                  .. "\\end{document}\n"
    io.output(tex_path)
    io.write(full_doc)

    return pandoc.pipe("pdflatex", {"--jobname=" .. dvi_path},  "tikzz.latex")
end

local function makeSvg(dvi)
    return os.pipe("dvisvgm", {"--no-fonts"}, dvi)
end

return {
    {
        CodeBlock = function(block)
            if block.classes[1] == "tikz" then
                local mydude = makeDvi(block.text)
                print("OUTPUT: " .. mydude)
            end
        end,
    }
}

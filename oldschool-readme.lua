--[[ oldschool-readme

    Copyright (c) 2018 Aman Verma
    This code is licensed under the MIT license
    You should have received a copy of the license along with this software.
    If not, see <https://opensource.org/licenses/MIT>

    
    This filter tries to write files in a basic plain format that you might
    use for README that is not meant to be ever rendered.
    Extends pandoc's `plain` output to add some more goodies like header
    underlines and link targets.
    Insipired by the readmes of bash and opus.
--]]
local stringify = (require 'pandoc.utils').stringify
local text = require('text')
local pr = require('pl.pretty')


local function setext(str, under_char)
    local norm_str = stringify(str)
    return norm_str, string.rep(under_char, #norm_str)
end

local function table_in(t, k)
    return t[k] ~= nil
end

local underchars = {
    [0] = '#',
    [1] = '=',
    [2] = '~',
    [3] = '-',
}

-- tests
-- print(setext('nice', '^'))

return {
    {
        Code = function(elem)
            elem.text = '`' .. elem.text .. '`' 
            return elem
        end,

        Link = function(elem)
            local cont = stringify(elem.content)
            if cont ~= elem.target then
                return pandoc.RawInline(
                    'plain', cont .. '<' .. elem.target .. '>'
                )
            else
                return pandoc.RawInline('plain', '<' .. cont .. '>')
            end
        end,

        Header = function(elem)
            if table_in(underchars, elem.level) then
                local cont, underline = setext(elem.content, underchars[elem.level])
                plain_header = pandoc.Plain({
                    pandoc.RawInline('plain', cont),
                    pandoc.LineBreak(),
                    pandoc.RawInline('plain', underline),
                })
                return plain_header
            end
        end,

        Meta = function(m)
            local title, underline = setext(m.title, underchars[0])
            m.title = pandoc.MetaInlines({
                pandoc.RawInline('plain', text.upper(title)),
                pandoc.LineBreak(),
                pandoc.RawInline('plain', underline),
            })
            return m
        end,
    }
}

--- oldschool: render a plain text file with fancy ASCII formatting
-- © 2020 Aman Verma. Distributed under the MIT license.

local stringify = (require 'pandoc.utils').stringify
local text = require('text')

local function setext(str, under_char)
  local norm_str = stringify(str):gsub('%s+$', '')
  return norm_str, string.rep(under_char, #norm_str)
end

local underchars = {
  [0] = '#',
  [1] = '=',
  [2] = '-',
}

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
      if underchars[elem.level] then
        local cont, underline = setext(elem.content, underchars[elem.level])
        plain_header = pandoc.Plain{
          pandoc.RawInline('plain', cont),
          pandoc.LineBreak(),
          pandoc.RawInline('plain', underline),
        }
        return plain_header
      end
    end,

    Meta = function(m)
      local title, underline = setext(m.title, underchars[0])
      m.title = pandoc.MetaInlines{
        pandoc.RawInline('plain', text.upper(title)),
        pandoc.LineBreak(),
        pandoc.RawInline('plain', underline),
      }
      return m
    end,
  }
}

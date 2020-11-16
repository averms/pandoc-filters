--- standard-code: ouput code blocks with class="language-*" attributes
-- © 2020 Aman Verma. Distributed under the MIT license.

m4_include(languages.lua.m4)m4_dnl

local function escape(s)
  -- Escape according to HTML 5 rules
  return s:gsub(
    [=[[<>&"']]=],
    function(x)
      if x == '<' then
        return '&lt;'
      elseif x == '>' then
        return '&gt;'
      elseif x == '&' then
        return '&amp;'
      elseif x == '"' then
        return '&quot;'
      elseif x == "'" then
        return '&#39;'
      else
        return x
      end
    end
  )
end

local function getCodeClass(classes)
  -- Check if the first element of classes (pandoc.CodeBlock.classes) matches a
  -- programming language name. If it does, it gets removed from classes and a valid
  -- HTML class attribute string (with space at beginning) is returned.

  if languages[classes[1]] then
    return ' class="language-' .. table.remove(classes, 1) .. '"'
  else
    return ''
  end
end

local function makeIdentifier(ident)
  -- Returns a valid HTML id attribute (with space at beginning) OR empty string.

  if #ident ~= 0 then
    return ' id="'.. ident .. '"'
  else
    return ''
  end
end

local function makeClasses(classes)
  -- Returns a valid HTML class attribute with classes separated by spaces (with a space
  -- at the beginning) OR empty string.

  if #classes ~= 0 then
    return ' class="' .. table.concat(classes, ' ') .. '"'
  else
    return ''
  end
end

return {
  {
    CodeBlock = function(elem)
      if FORMAT ~= 'html' then
        return nil
      end

      id = makeIdentifier(elem.identifier)
      classLang = getCodeClass(elem.classes)
      classReg = makeClasses(elem.classes)

      local preCode = string.format(
        '<pre%s%s><code%s>%s</code></pre>', id, classReg, classLang, escape(elem.text)
      )
      return pandoc.RawBlock('html', preCode, 'RawBlock')
    end,

  }
}

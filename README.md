# Pandoc filters

A collection of pandoc filters. They are written in Lua, [which makes them
faster than filters written in any other language][1]. Copy from the `dist`
folder into `$HOME/.local/share/pandoc/filters`. Use them with `--lua-filter`.

[1]: https://pandoc.org/lua-filters.html

## Usage

### code-includes

_For all output formats_

Include code from another file by using a code block attribute and the name of the file
inside the code block. This is useful for a couple of reasons:

- You can keep code examples in separate directory and keep everything in sync.
- Large scripts that you don't want to scroll past can be kept in a separate file.

File paths can be either absolute or relative. Relative paths are relative to
the directory from which pandoc is run.

````
```{.python inc=yes}
/path/to/file.py
```
````

### standard-code

_For HTML output_

Pandoc has great syntax highlighting built-in but sometimes you just want to use
something else. Unfortunately, the default pandoc codeblock output with `--no-highlight`
looks like this:

    <pre class="lua"><code>print 'Hello World!'</code></pre>

The above is not what the [W3C recommends][spec], nor is it compatible with prism.js.
This filter makes sure pandoc outputs the recommended syntax:

    <pre><code class="language-lua">print 'Hello World!'</code></pre>

Using `standard-code.lua` doesn't require any changes in your source file.

[spec]: https://www.w3.org/TR/html5/text-level-semantics.html#the-code-element

### transclude

_For all output formats_

Include content from another file just like in AsciiDoc and ReST. Is recursive and works
with spaces in file names.

The [official Pandoc filters repository has a filter][paf] that does this and has a
couple of extra features. Use that one instead.

Note that neither filter can resolve internal references between files like
footnotes or citations (with pandoc-citeproc). If you _do_ want internal
references to work, try [`m4`][m4], a generic preprocessor that should already
be installed on your Linux/macOS system. You can also try [`pp`][pp], which has
better defaults. Alternatively, you could probably write your own in less than
20 lines of Perl/Python/Awk.

[paf]: https://github.com/pandoc/lua-filters/tree/master/include-files
[m4]: https://www.gnu.org/software/m4/m4.html
[pp]: http://christophe.delord.free.fr/pp/download.html

### oldschool (under construction)

_For plain output_

Tries to write files in a basic plain format that you might use for a README
that is never meant to be rendered. Extends pandoc's `plain` output to add some
more goodies like header underlines and link targets. Use with like this:

    pandoc -s -t plain --lua-filter oldschool.lua -o <output> <input>

Insipired by the READMEs of Bash and Opus.

## License

All filters are distributed under the MIT license.

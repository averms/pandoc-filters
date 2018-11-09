# Pandoc filters

A collection of pandoc filters that I have made. They are written in lua, [which makes
them faster than filters written in any other language][1]. Copy them into
`$HOME/.pandoc/filters`. Use them with `--lua-filter`.

[1]: https://pandoc.org/lua-filters.html

## Descriptions

### `code-includes`

Include code from another file by using a code block attribute and the name of the file
inside the code block. This is useful for a couple of reasons:

* You can keep code examples in separate directory and keep everything in sync.
* Large scripts that you don't want to scroll past can be kept in a separate file.

```
~~~{.python file=anything_here}
/path/to/file.py
~~~
```

**TODO:** include specific lines

### `md-includes`

Include content from another file just like AsciiDoc and ReST. This only works once, so
included files can't include other files. **Blank lines are necessary**.

    text text.

    ![anything here doesn't make it](/path/to/file.md){file=yes}

    text text text.

If you _do_ want to recursively include files, try [m4](https://www.gnu.org/software/m4/m4.html),
a generic preprocessor. Make sure you change the default quotation marks with `changequote`.

### `standard-code`

Pandoc has great syntax highlighting by default but sometimes you just want to apply your own styling.
Unfortunately, the default pandoc codeblock output with `--no-highlight` looks like this:

    <pre class="haskell"><code>import System.Environment
    main = do
    getArgs >>= print
    getProgName >>= print
    getEnvironment >>= print
    </code></pre>

This is not HTML5 compliant, nor is it compatible with `prism.js` or `highlight.js`. This filter
makes sure pandoc outputs the correct, html5 compliant syntax:

    <pre><code class="language-haskell">import System.Environment
    main = do
    getArgs >>= print
    getProgName >>= print
    getEnvironment >>= print
    </code></pre>

It passes through all #identifiers and .classes that don't match a programming language name.

## License

Files in this repository are made available under the [MIT License](LICENSE)

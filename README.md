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

    ~~~{.python file=anything_here}
    /path/to/file.py
    ~~~

TODO: include specific lines

### `md-includes`

Include content from another file similar to AsciiDoc and ReST. This only works once, so
included files can't include other files. **Blank lines are necessary**.

    text text.

    ![anything here doesn't make it](/path/to/file.md){file=yes}

    text text text.

If you _do_ want to recursively include files, try [PP](https://github.com/CDSoft/pp),
a generic preprocessor made for pandoc. It offers a lot more than you can do with pure
filters.

## License

Files in this repository are made available under the [MIT License](LICENSE)

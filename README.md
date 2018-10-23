# Pandoc filters

A collection of pandoc filters that I have made. They are written in lua, [which makes
them faster than filters written in any other language][1]. Copy them into
`$HOME/.pandoc/filters`. Use them with `--lua-filter`.

[1]: https://pandoc.org/lua-filters.html

## Descriptions

### `code-includes`

Include code from another file by using a code block attribute. This is useful
for many reasons:

* You can keep code examples in separate dir and keep everything in sync.
* Large scripts that you don't want to scroll past can be kept in a separate file.

    ~~~{.python include=/path/to/file.py}
    whatever is in here will get replaced
    ~~~

TODO: include specific lines

### `md-includes`


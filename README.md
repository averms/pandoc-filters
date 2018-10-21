# Pandoc filters

A collection of pandoc filters that I have made. Copy them into
`$HOME/.pandoc/filters`. Use them with `--lua-filter`

## Descriptions

### `code-includes`

Include code from another file by using a code block attribute.

    ~~~{.python include=/path/to/file.py}
    whatever is in here will get replaced
    ~~~

TODO: include specific lines

### `md-includes`


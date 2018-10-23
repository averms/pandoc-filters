For `code-includes`
-------------------

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Lectus vestibulum
mattis ullamcorper velit sed. Sagittis vi. Here is **test 1 of
`code-includes`**:

``` {.lua file=""}
-- Test file
a = {}
a[1] = 2
print(a[1])
```

But I must explain to you how all this mistaken idea of denouncing
pleasure and praising pain was born and I will give you a complete
account of the system, and expound the actual teachings of the great
explorer of the truth, the master-builder of human happiness. Here is
**test 2 of `code-includes`**:

``` {.lua file="no"}
-- Test file
a = {}
a[1] = 2
print(a[1])
```

Here is **Test 3 of `code-includes`**:

``` {#file .aa}
yes
// This should be kept

please don't fold it
nope.
```

For `md-includes`
-----------------

fdsafsadflkj. **Test 1 of `md-includes`**:

Pandoc filters
==============

A collection of pandoc filters that I have made. They are written in
lua, [which makes them faster than filters written in any other
language](https://pandoc.org/lua-filters.html). Copy them into
`$HOME/.pandoc/filters`. Use them with `--lua-filter`.

Descriptions
------------

### `code-includes`

Include code from another file by using a code block attribute. This is
useful for many reasons:

-   You can keep code examples in separate dir and keep everything in
    sync.
-   Large scripts that you don't want to scroll past can be kept in a
    separate file.

    ``` {.python include="/path/to/file.py"}
    whatever is in here will get replaced
    ```

TODO: include specific lines

### `md-includes`

**Test 2 of `md-includes`**:

![this shouldn't
work](https://upload.wikimedia.org/wikipedia/commons/b/bd/Test.svg)

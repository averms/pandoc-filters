filter='../../dist/code-includes.lua'
case1='case_one.md'
pandoc="pandoc --no-highlight -L $filter"

test_html "$case1"
test_md "$case1"
test_native "$case1"

printf 'code-includes OK\n'

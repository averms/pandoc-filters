filter='../../dist/standard-code.lua'
case1='case_one.md'
pandoc="pandoc --no-highlight -L $filter"

test_html "$case1"

printf 'standard-code OK\n'

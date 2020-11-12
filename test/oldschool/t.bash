source ../t.bash
filter='../../dist/oldschool.lua'
pandoc="pandoc -s --verbose --reference-links --reference-location section -L $filter"

case1='oldschool.md'
case2='simple.md'

test_cmarkx "$case2"

printf 'oldschool OK\n'

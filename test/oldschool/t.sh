filter='../../dist/oldschool.lua'
case1='oldschool.md'
pandoc="pandoc -s -L $filter"

test_plain "$case1"

printf 'oldschool OK\n'

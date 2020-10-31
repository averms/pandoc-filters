#!/usr/bin/env bash
set -euo pipefail

test_json() {
    in="$1"
    out="out/${1%md}json"
    outexp="${out}.exp"
    $pandoc -f markdown -t json "$in" -o "$out"
    diff -u "$outexp" "$out"
}

test_html() {
    in="$1"
    out="out/${1%md}html"
    outexp="${out}.exp"
    $pandoc -f markdown -t html "$in" -o "$out"
    diff -u "$outexp" "$out"
}

test_md() {
    in="$1"
    out="out/${1%md}markdown"
    outexp="${out}.exp"
    $pandoc -f markdown -t markdown "$in" -o "$out"
    diff -u "$outexp" "$out"
}

test_plain() {
    in="$1"
    out="out/${1%md}txt"
    outexp="${out}.exp"
    $pandoc -f markdown -t plain "$in" -o "$out"
    diff -u "$outexp" "$out"
}

(
    cd code-includes
    mkdir -p out
    source t.sh
)
(
    cd standard-code
    mkdir -p out
    source t.sh
)

# (
#     cd oldschool
#     source t.sh
# )
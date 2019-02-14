#!/bin/sh
set -e

if [ $# -ne 1 ]; then
    printf >&2 "Usage: %s <basename>\n\n" "${0##*/}"
    printf >&2 "Finds differences between <basename>.* and <basename>.exp.*\n"
    exit 1
fi

diff --strip-trailing-cr -u "exp.$1.txt" "$1.txt"
if [ "$1" != "oldschool" ]; then
    diff --strip-trailing-cr -u "exp.$1.html" "$1.html"
    diff --strip-trailing-cr -u "exp.$1.json" "$1.json"
fi

echo "Diffs successfully computed for $1"

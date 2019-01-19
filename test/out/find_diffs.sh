#!/bin/sh
set -e

if [ $# -ne 1 ]; then
    printf >&2 "Usage: $0 <basenames>\n\n"
    printf >&2 "Finds differences between <basename>.* and exp.*\n"
    exit 1
fi

for i in "$1".*; do
    diff --strip-trailing-cr -u "exp.${i#$1.}" "$i"
done

echo "Diffs successfully computed for $1"

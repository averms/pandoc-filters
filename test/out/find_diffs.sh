#!/bin/bash
set -eo pipefail

if [ $# != 1 ]; then
    echo >&2 "Usage:"
    echo >&2 "    $0 basename_of_files_to_test"
    exit 1
fi

for i in "$1".*; do
    diff --strip-trailing-cr -u "exp.${i#$1.}" "$i"
done

echo "Diffs successfully computed for $1"

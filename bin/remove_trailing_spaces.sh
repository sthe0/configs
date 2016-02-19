#! /bin/bash

find -X . \
    -name "*.cpp" \
    -or -name "*.h" \
    -or -name "*.py" \
    -or -name "*.js" \
    -or -name "*.html" \
    -or -name "*.css" \
    -or -name "*.sh" \
    -or -name "Makefile" \
    | xargs sed -i "s/[ \t]\+\$//"

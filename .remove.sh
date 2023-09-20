#/bin/bash

set -xe

source_file=(
    "/home/zakwan/.xsession-errors"
    "/home/zakwan/.xsession-errors.old"
)

errors=false

for file in "${source_file[@]}"; do
    rm -rf "$file"

    if [ $? -ne 0 ]; then
        errors=true
        echo "Error: Failed to delete $file"
    fi
done

if [ "$errors" = false ]; then
    echo "Files deleted!"
fi

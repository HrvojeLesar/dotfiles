#!/usr/bin/bash

for file in ./*.gpg; do
    outfile="${file%.gpg}"
    gpg -d -o $outfile "$file"

    if [[ ! -f "$file" ]]; then
        echo "No .gpg files found in $DIR."
        exit 0
    fi

    if [[ $outfile == *.pub ]]; then
        chmod 644 $outfile
    else
        chmod 600 $outfile
    fi

done

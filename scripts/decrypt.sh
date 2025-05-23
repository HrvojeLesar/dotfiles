#!/usr/bin/bash

if [[ -d $1 ]]; then
    dir=${1%/}
    for file in $dir/*.gpg; do
        outfile="${file%.gpg}"
        gpg -d -o $outfile "$file"
    done
elif [[ -e $1 ]]; then
    file=$1
    ! [[ $file == *.gpg ]] && echo "File must end with .gpg" && exit
    outfile="${file%.gpg}"
    gpg -d -o $outfile "$file"
fi

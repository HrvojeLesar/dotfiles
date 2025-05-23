#!/usr/bin/bash

should_skip() {
    file=$1
    [[ $file == *.gpg ]] && echo "skip"
    [[ $file == *encrypt.sh ]] && echo "skip"
    [[ $file == *decrypt.sh ]] && echo "skip"
    [[ $file == *.gitignore ]] && echo "skip"
    [[ $file == *setupfiles.sh ]] && echo "skip"
}

encrypt() {
    file=$1
    gpg --output "${file}.gpg" --encrypt --recipient hrvoje.lesar1@hotmail.com $file
}

if [[ -d $1 ]]; then
    dir=${1%/}
    for file in $dir/*; do
        skip=$(should_skip $file)
        [[ $skip == "skip" ]] && continue
        encrypt $file
    done
elif [[ -e $1 ]]; then
    file=$1
    skip=$(should_skip $file)
    [[ $skip == "skip" ]] && echo "Cannot encrypt file" && exit
    encrypt $file
fi

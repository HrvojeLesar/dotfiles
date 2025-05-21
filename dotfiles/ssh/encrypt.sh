#!/usr/bin/bash

for file in ./*; do
    [[ $file == *.gpg ]] && continue
    [[ $file == *encrypt.sh ]] && continue
    [[ $file == *decrypt.sh ]] && continue
    [[ $file == *.gitignore ]] && continue
    gpg --output "${file}.gpg" --encrypt --recipient hrvoje.lesar1@hotmail.com $file
done

#!/usr/bin/env bash

set -e

input_file="$1"
output_file="$input_file.enc"

if [[ -w "$output_file" ]]; then
  echo "The file $output_file exists, overwrite? y/n"
  read answer

  if [[ ! "$answer" = [yY] ]]; then
    echo "Aborting."
    exit 0
  fi
fi

echo "Encrypting..."
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 1000 -salt -in "$1" -out "$1.enc"
echo "Saved encrypted $input_file to $output_file."


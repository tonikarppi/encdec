#!/usr/bin/env bash

set -e

input_file="$1"

if [[ ! -f "$input_file" ]]; then
  echo "File $input_file could not be found, aborting."
  exit 1
fi

if [[ "$input_file" != *.gpg ]]; then
  echo "Error: expected file to have extension '.gpg'."
  exit 1
fi

output_file=$(basename "$input_file" .gpg)

if [[ -w "$output_file" ]]; then
  echo "The file $output_file exists, overwrite? (y/n)"
  read answer

  if [[ ! "$answer" = [yY] ]]; then
    echo "Aborting."
    exit 0
  fi
fi

echo "Decrypting..."
gpg -d $input_file > $output_file
echo "Saved decrypted $input_file to $output_file."


#!/usr/bin/env bash

set -e

input_file="$1"

if [[ ! -f "$input_file" ]]; then
  echo "File $input_file could not be found, aborting."
  exit 1
fi

output_file="$input_file.gpg"

echo "Encrypting..."
gpg -c -o "$output_file" "$input_file"
echo "Saved encrypted $input_file to $output_file."


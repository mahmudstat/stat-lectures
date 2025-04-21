#!/bin/bash

cd "$(dirname "$0")/.."

OUTPUT_FILE="pdf_links.md"
> "$OUTPUT_FILE"

BASE_URL="https://docs.statmania.info/question"
FOLDERS=("2022" "2023" "2024" "43rd_batch" "44th_batch" "45th")

for folder in "${FOLDERS[@]}"; do
  files=$(find "question/$folder" -maxdepth 1 -type f -iname "*.pdf" | sort)

  if [[ -n "$files" ]]; then
    echo "### $folder" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Initialize counter for ordered list
    counter=1

    while IFS= read -r filepath; do
      filename=$(basename "$filepath")
      link="$BASE_URL/$folder/$filename"

      # Remove stat1 or stat2 prefix, replace _ with -, and capitalize the first letter of each word
      display_name=$(echo "$filename" | sed -E 's/^stat[12]_//' | sed 's/_/-/g' | awk 'BEGIN {FS="-"} {for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1' )

      # Add ordered list item with the link
      echo "$counter. [$display_name]($link)" >> "$OUTPUT_FILE"

      # Increment counter for the next item
      ((counter++))

    done <<< "$files"

    echo "" >> "$OUTPUT_FILE"
  fi
done

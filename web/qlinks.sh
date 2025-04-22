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

    counter=1

    while IFS= read -r filepath; do
      filename=$(basename "$filepath")
      link="$BASE_URL/$folder/$filename"

      # Replace underscores with spaces and remove .pdf extension
      name_part=$(echo "$filename" | sed 's/_/ /g' | sed 's/.pdf$//')

      # Capitalize the first letter of each word, then append ".pdf"
      display_name=$(echo "$name_part" | awk '{
        for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))
        print $0 ".pdf"
      }')

      # Output as an ordered Markdown list
      echo "$counter. [$display_name]($link)" >> "$OUTPUT_FILE"
      ((counter++))
    done <<< "$files"

    echo "" >> "$OUTPUT_FILE"
  fi
done

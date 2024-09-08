#!/bin/bash

# Function to list files with their content recursively, excluding directories
list_files_and_contents() {
  for file in "$1"/*; do
    if [ -d "$file" ]; then
      # Skip excluded directories anywhere in the recursion
      for exclude in "${EXCLUDE_DIRS[@]}"; do
        if [[ "$file" == *"$exclude"* ]]; then
          continue 2  # Skip this directory and move to the next one
        fi
      done
      # If it's a directory, recurse into it
      list_files_and_contents "$file"
    elif [ -f "$file" ]; then
      # If it's a file, display its path and content
      echo "File: $file"
      echo "Contents:"
      cat "$file"
      echo "-------------------------------------"
    fi
  done
}

# Check if the directory path is passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory> --exclude <dir1> <dir2> ..."
  exit 1
fi

# Array to hold directories to exclude
EXCLUDE_DIRS=()

# Parse the exclude options
while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --exclude)
      shift
      while [[ "$#" -gt 0 && ! "$1" =~ --* ]]; do
        EXCLUDE_DIRS+=("$1")
        shift
      done
      ;;
    *)
      TARGET_DIR="$1"
      shift
      ;;
  esac
done

# Make sure the target directory is set
if [ -z "$TARGET_DIR" ]; then
  echo "Error: Target directory is not specified."
  exit 1
fi

# Start the recursive file listing
list_files_and_contents "$TARGET_DIR"

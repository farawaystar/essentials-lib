#!/bin/bash


# File Concatenator
# A simple bash script that scans project directory for files with specific extensions, 
# concatenates them into a single output file, adds helpful headers to identify each file's 
# content & path from project root. It also ignores all files in your .gitignore to exclude 
# uninmportant files, making it ideal for code documentation and review.


# Configuration
output_file="combined.txt"
extensions=("json" "toml" "rs" "sh")  # Modify this array to change file types
top_directory="."  # Uses current working directory
ignore_files=("concat_files_all.sh" "combined.txt")


# Get the name of the current folder
current_folder=$(basename "$(pwd)")

# Clear output file
> "$output_file"
current_date=$(date +"%A, %B %d, %Y, %I %p %Z")

# Use git ls-files to respect .gitignore
git ls-files "$top_directory" | grep -E "$(IFS=\|; echo "${extensions[*]}")$" | while read -r file; do
    if [[ ! " ${ignore_files[@]} " =~ " $(basename "$file") " ]]; then
        echo "/* ------------------------------------------------" >> "$output_file"
        echo "My $current_folder/$file is as follows:" >> "$output_file"
        echo "--------------------------------------------------- */" >> "$output_file"
        echo "Current date: $current_date" >> "$output_file"
        echo "" >> "$output_file"
        cat "$file" >> "$output_file"
        echo "" >> "$output_file"
    fi
done

echo "Files concatenated: ${extensions[*]}"
echo "Output: $output_file"

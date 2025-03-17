# Essential coding tools library

01. File Concatenator

A simple bash script that combines multiple files of specified types into a single text file with clear file demarcations.

## Description

This script scans your project directory for files with specific extensions, concatenates them into a single output file, and adds helpful headers to identify each file's content. It respects your `.gitignore` settings by using `git ls-files` to find files, making it ideal for code documentation and review.

## Features

- Combines files with specified extensions (default: json, toml, rs, sh)
- Adds descriptive headers for each file section
- Includes timestamps for documentation purposes
- Respects `.gitignore` patterns
- Allows specific files to be excluded from concatenation

## Requirements

- Bash shell
- Git (the repository must be initialized with git)


## Usage

1. Make the script executable:
   ```
   chmod +x concat_files.sh
   ```

2. Run the script from your project directory:

```bash
./concat_files.sh
```

### Customization

You can modify these variables at the top of the script to customize behavior:

- `output_file`: Name of the combined output file (default: "combined.txt")
- `extensions`: Array of file extensions to include (default: "json" "toml" "rs" "sh")
- `top_directory`: Starting directory for file search (default: current directory)
- `ignore_files`: Array of filenames to exclude from concatenation

## Example Output

The combined file will have sections like:

```
/* ------------------------------------------------
My project_name/src/main.rs is as follows:
--------------------------------------------------- */
Current date: Monday, March 17, 2025, 05:12 AM CET

// Content of main.rs file here...

/* ------------------------------------------------
My project_name/config.toml is as follows:
--------------------------------------------------- */
Current date: Monday, March 17, 2025, 05:12 AM CET

# Content of config.toml file here...
```

## License

This script is provided under the MIT License. Feel free to modify and distribute as needed.

---

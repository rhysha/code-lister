# File Content Viewer with Directory Exclusion Script

This repository contains a powerful and flexible **Bash script** that allows users to **recursively list files** within a specified directory and display their contents. It also includes an important feature: the ability to **exclude specific directories** from the recursive search, no matter where they appear in the directory tree.

## Purpose

This script is designed for users who need to **explore the contents of files** within a directory and its subdirectories but also want to **ignore specific directories** that might clutter the search. For example, a user might have a large project directory but want to skip certain directories (like build files, logs, or temporary data) from being included in the file search and content display.

The key functionality of this script is:

- **Recursive File Listing**: The script traverses all directories within a given directory, recursively listing every file it finds.
- **Content Display**: For each file, the script outputs the full file path followed by the contents of the file.
- **Directory Exclusion**: The user can specify one or more directories to exclude from the recursive search. These directories will be skipped at any level of the directory hierarchy, saving time and ensuring the user gets only the information they care about.

## Use Case

This script is especially useful in contexts such as:

- **Large Codebases**: Developers or researchers working with large projects often have directories they don't need to examine (such as `node_modules`, `build`, or `log` directories). This script allows them to list and view important files while skipping unnecessary directories.
- **Configuration File Reviews**: System administrators might want to review specific types of configuration files or scripts but want to ignore certain directories that don't contain relevant data.
- **Data Analysis**: In data science or machine learning projects, users might want to review specific data files (like CSVs or JSONs) while skipping directories containing auxiliary files (like checkpoints or cached data).
- **Project Audits**: Auditors or maintainers can use this script to quickly explore project structures and examine the contents of key files while ignoring large, irrelevant directories.

## Key Features

- **Recursion with Exclusions**: The script recursively lists files and directories starting from a given directory, but it allows for **flexible exclusion** of specific directories, no matter where they occur in the recursive process.
  
- **Detailed File Information**: For each file found, the script outputs:
  - The **full path** of the file.
  - The **contents of the file** (displayed after the path).

- **Flexible Directory Exclusion**: Users can specify directories to exclude from the search using the `--exclude` option. These directories will be ignored even if they are nested multiple levels deep.

## How the Script Works

1. **Input**: The user provides a base directory to search. Optionally, the user can specify one or more directories to exclude using the `--exclude` flag.
2. **Processing**: The script traverses the directory structure recursively. For every file it encounters, it prints the file's path and contents.
3. **Exclusion Logic**: Directories specified with `--exclude` are skipped during the recursive search. This ensures that files in these directories are not listed or processed.
4. **Output**: The script outputs a list of file paths and file contents, making it easy for the user to quickly inspect files without manually opening each one.

## Example Scenarios

### Scenario 1: Exploring a Codebase
Suppose you're a developer working with a large codebase. You want to explore all files but exclude certain directories like `node_modules` and `dist` that only contain generated files and aren't necessary for inspection. This script allows you to:
```bash
./list_files_exclude.sh /path/to/project --exclude node_modules dist

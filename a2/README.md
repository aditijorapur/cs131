# Count of File Types in a Directory

## What the command does
The `countfile.bash` script counts the number of files of each type (based on file extensions) in a given directory. It loops through the files in the directory, identifies their extensions, and displays the count for each type.The files without any extensions are ignored.

## When this command is useful
- Determine the distribution of each file in a directory. 
- See how many files of each type are in a directory without manually having to check each file.
- Offers a quick summary of the count of each file.

## How to run the command
1. Open the terminal window
2. Navigate to the directory that contains 'countfile.sh'
3. Run the script by entering the path to the directory you want to use

```bash
./countfile.sh /path/to/directory
```

## Example

Input:
```bash
./countfile.sh testdirectory
```

Output: 
```bash
Counts of the file types in - testdirectory:
txt: 3
jpg: 1
docx: 1
pdf: 2
```

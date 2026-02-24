# Text-Processing Commands

### Basic Text Viewing and Extraction
- View entire file content: `cat file.txt`
- View file with line numbers: `cat -n file.txt`
- Concatenate multiple files: `cat file1.txt file2.txt > combined.txt`
- View file in reverse (last line first): `tac file.txt`
- View file content (paged): `less file.txt`
- View file and allow searching: `more file.txt`
- View first 10 lines: `head file.txt`
- View first N lines: `head -n 20 file.txt`
- View first N bytes: `head -c 100 file.txt`
- View last 10 lines: `tail file.txt`
- View last N lines: `tail -n 20 file.txt`
- Follow file updates in real-time: `tail -f file.txt`
- Follow file updates (even if recreated): `tail -F file.txt`
- Show last N bytes: `tail -c 100 file.txt`
- Extract specific lines (e.g., 5 to 10): `sed -n '5,10p' file.txt`
- Extract lines matching a pattern: `grep "pattern" file.txt`
- Extract everything EXCEPT matches: `grep -v "pattern" file.txt`
- Number each line of a file: `nl file.txt`
- Number lines with custom format: `nl -s " : " file.txt`

### Pattern Matching and Searching (Grep)
- Search for a string in a file: `grep "string" file.txt`
- Case-insensitive search: `grep -i "string" file.txt`
- Recursive search in directory: `grep -r "string" /path/to/dir`
- Recursive search (follow links): `grep -R "string" /path/to/dir`
- Show line numbers of matches: `grep -n "string" file.txt`
- Count number of matches: `grep -c "string" file.txt`
- List only filenames with matches: `grep -l "string" *.txt`
- List filenames without matches: `grep -L "string" *.txt`
- Match whole words only: `grep -w "string" file.txt`
- Match exact lines only: `grep -x "exact line" file.txt`
- Show N lines before a match: `grep -B 3 "string" file.txt`
- Show N lines after a match: `grep -A 3 "string" file.txt`
- Show N lines around a match: `grep -C 3 "string" file.txt`
- Use Extended Regular Expressions: `grep -E "pattern1|pattern2"` (or `egrep`)
- Use Fixed Strings (no regex): `grep -F "string*"` (or `fgrep`)
- Use Perl-compatible Regex: `grep -P "\d{3}-\d{2}" file.txt`
- Stop after first N matches: `grep -m 5 "string" file.txt`
- Highlight matches: `grep --color "string" file.txt`
- Print only the matching part: `grep -o "pattern" file.txt`

### Text Transformation and Substitution (Sed & Tr)
- Replace first occurrence in each line: `sed 's/old/new/' file.txt`
- Replace all occurrences (globally): `sed 's/old/new/g' file.txt`
- Replace in-place (save changes to file): `sed -i 's/old/new/g' file.txt`
- Delete lines matching a pattern: `sed '/pattern/d' file.txt`
- Delete specific line number: `sed '5d' file.txt`
- Delete empty lines: `sed '/^$/d' file.txt`
- Print only specific lines: `sed -n '1,5p' file.txt`
- Insert a line before a match: `sed '/pattern/i new_line' file.txt`
- Append a line after a match: `sed '/pattern/a new_line' file.txt`
- Convert lowercase to uppercase: `tr 'a-z' 'A-Z' < file.txt`
- Delete specific characters: `tr -d 'aeiou' < file.txt`
- Squeeze multiple spaces into one: `tr -s ' ' < file.txt`
- Complement characters (delete non-digits): `tr -cd '0-9\n' < file.txt`
- Translate characters using sets: `tr '0-9' 'a-j' < file.txt`

### Column-Based Extraction (Cut & Awk)
- Extract first column (comma delimiter): `cut -d',' -f1 file.csv`
- Extract multiple columns: `cut -d',' -f1,3,5 file.csv`
- Extract character range (1-10): `cut -c1-10 file.txt`
- Extract from column N to end: `cut -d' ' -f3- file.txt`
- Print first column with Awk: `awk '{print $1}' file.txt`
- Print last column with Awk: `awk '{print $NF}' file.txt`
- Print lines where column 2 > 100: `awk '$2 > 100' file.txt`
- Print lines matching pattern in column 1: `awk '$1 ~ /pattern/' file.txt`
- Custom output separator in Awk: `awk -v OFS=',' '{print $1, $2}' file.txt`
- Calculate sum of a column: `awk '{sum += $1} END {print sum}' file.txt`
- Calculate average of a column: `awk '{sum += $1} END {print sum/NR}' file.txt`
- Find max value in a column: `awk 'max < $1 {max = $1} END {print max}' file.txt`

### Sorting and Uniqueness
- Sort lines alphabetically: `sort file.txt`
- Sort lines numerically: `sort -n file.txt`
- Sort lines in reverse order: `sort -r file.txt`
- Sort based on specific column: `sort -k2 file.txt`
- Sort and remove duplicates: `sort -u file.txt`
- Human-numeric sort (e.g., 2K, 1G): `sort -h file.txt`
- Randomize lines: `sort -R file.txt`
- Check if file is sorted: `sort -c file.txt`
- Remove adjacent duplicate lines: `uniq file.txt`
- Show only unique lines: `uniq -u file.txt`
- Show only duplicated lines: `uniq -d file.txt`
- Count occurrences of each line: `uniq -c file.txt`
- Case-insensitive uniqueness: `uniq -i file.txt`
- Skip first N fields before checking uniqueness: `uniq -f 2 file.txt`

### Text Formatting and Alignment
- Reformat paragraphs to width: `fmt -w 60 file.txt`
- Wrap lines at specific width: `fold -w 80 file.txt`
- Format as table/columns: `column -t file.txt`
- CSV to table format: `column -s, -t file.csv`
- Expand tabs to spaces: `expand file.txt`
- Convert spaces to tabs: `unexpand file.txt`
- Add line prefix/suffix with sed: `sed 's/^/Prefix /' file.txt`
- Join lines into one: `paste -s -d' ' file.txt`
- Indent lines: `pr -t -e4 file.txt`

### Line, Word, and Character Counting
- Count lines, words, and characters: `wc file.txt`
- Count lines only: `wc -l file.txt`
- Count words only: `wc -w file.txt`
- Count characters only: `wc -m file.txt`
- Count bytes only: `wc -c file.txt`
- Show length of longest line: `wc -L file.txt`

### File Comparison and Merging
- Compare two files line by line: `diff file1.txt file2.txt`
- Compare files side-by-side: `sdiff file1.txt file2.txt`
- Compare files ignoring whitespace: `diff -w file1.txt file2.txt`
- Unified diff format (for patches): `diff -u file1.txt file2.txt`
- Compare three files: `diff3 file1 file2 file3`
- Show common/unique lines: `comm file1.txt file2.txt`
- Show lines unique to file1: `comm -23 file1.txt file2.txt`
- Merge lines of files side-by-side: `paste file1.txt file2.txt`
- Merge lines with custom delimiter: `paste -d',' file1.txt file2.txt`
- Join files on a common field: `join -1 1 -2 1 file1.txt file2.txt`

### Encoding and Conversion
- Convert encoding (e.g., ISO to UTF-8): `iconv -f ISO-8859-1 -t UTF-8 file.txt`
- Convert DOS line endings to Unix: `dos2unix file.txt`
- Convert Unix line endings to DOS: `unix2dos file.txt`
- Base64 encode: `base64 file.txt`
- Base64 decode: `base64 -d encoded.txt`
- URL encode (using perl): `perl -MURI::Escape -ne 'print uri_escape($_)'`
- Hex dump of a file: `hexdump -C file.bin`
- View binary file as strings: `strings file.bin`

### Miscellaneous Text Tools
- Reverse each line character-wise: `rev file.txt`
- Split large file into pieces: `split -l 1000 largefile.txt segment_`
- Split file by size: `split -b 10M largefile.txt segment_`
- View non-printable characters: `cat -v file.txt`
- Show line endings ($) and tabs (^I): `cat -A file.txt`
- Generate MD5 checksum: `md5sum file.txt`
- Generate SHA256 checksum: `sha256sum file.txt`
- Tee output to file and terminal: `command | tee file.txt`
- Append output using tee: `command | tee -a file.txt`
- Replace characters one-to-one (tr alternative): `sed 'y/abc/ABC/' file.txt`
- Extract email addresses (regex): `grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" file.txt`
- Remove all non-ASCII characters: `tr -cd '\11\12\15\40-\176' < file.txt`
- Transpose matrix (using awk): `awk '{for (i=1; i<=NF; i++) a[i,NR]=$i; if (NF>p) p=NF} END {for (i=1; i<=p; i++) {for (j=1; j<=NR; j++) printf a[i,j] (j==NR?ORS:OFS)}}' file.txt`
- Remove duplicate lines without sorting: `awk '!seen[$0]++' file.txt`
- Find text between two markers: `sed -n '/START/,/END/p' file.txt`
- Print only the lines that are different in file2 from file1: `grep -vFf file1.txt file2.txt`
- Get word frequency count: `grep -oE '\w+' file.txt | sort | uniq -c | sort -nr`
- Reverse lines characters (using perl): `perl -lpe '$_ = reverse' file.txt`
- Print lines matching any pattern from file: `grep -f patterns.txt file.txt`
- Replace only on a specific line: `sed '5s/old/new/' file.txt`
- Extract lines containing at least 3 words: `awk 'NF >= 3' file.txt`
- Print lines matching a pattern with line number and context: `grep -nC 2 "pattern" file.txt`
- Count characters in each line: `awk '{print length}' file.txt`

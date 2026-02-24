# File Management Commands

### Basic Listing and Navigation
- List files: `ls -l`
- Show hidden files: `ls -la`
- List files sorted by size: `ls -S`
- List files sorted by time: `ls -lt`
- List directories only: `ls -d */`
- List files recursively: `ls -R`
- Print current directory: `pwd`
- Change directory: `cd /path/to/dir`
- Go to home directory: `cd ~`
- Go to previous directory: `cd -`

### File Creation and Modification
- Create an empty file: `touch file.txt`
- Create a new directory: `mkdir mydir`
- Create nested directories: `mkdir -p parent/child/grandchild`
- Copy a file: `cp source.txt destination.txt`
- Copy a directory: `cp -r sourcedir destdir`
- Move or rename a file: `mv oldname.txt newname.txt`
- Rename multiple files (regex): `rename 's/old/new/' *.txt`
- Delete a file: `rm file.txt`
- Delete a file forcefully: `rm -f file.txt`
- Delete a directory (empty): `rmdir mydir`
- Delete a directory and its content: `rm -rf mydir`
- Create a symbolic link: `ln -s target linkname`
- Create a hard link: `ln target linkname`

### Viewing and Editing Files
- View file content: `cat file.txt`
- View file with line numbers: `cat -n file.txt`
- View file content (paged): `less file.txt`
- View first 10 lines: `head file.txt`
- View last 10 lines: `tail file.txt`
- Follow file updates in real-time: `tail -f file.txt`
- Edit file with nano: `nano file.txt`
- Edit file with vi/vim: `vi file.txt`
- View file type: `file file.txt`
- Show file metadata (stat): `stat file.txt`

### Searching and Finding
- Find files by name: `find /path -name "*.log"`
- Find directories only: `find /path -type d`
- Find files by size (+100MB): `find /path -size +100M`
- Find files modified in last 7 days: `find /path -mtime -7`
- Find and delete files: `find /path -name "*.tmp" -delete`
- Find files with specific permissions: `find /path -perm 777`
- Locate file (using database): `locate file.txt`
- Update locate database: `updatedb`
- Search for text in files: `grep "pattern" file.txt`
- Case-insensitive search: `grep -i "pattern" file.txt`
- Recursive search for text: `grep -r "pattern" /path`
- Show line number of match: `grep -n "pattern" file.txt`

### File Comparisons and Differences
- Compare two files: `diff file1.txt file2.txt`
- Compare files side-by-side: `sdiff file1.txt file2.txt`
- Show differences in unified format: `diff -u file1.txt file2.txt`
- Compare binary files: `cmp file1 bin2`
- Check if files are identical (MD5): `md5sum file1 file2`
- Check if files are identical (SHA256): `sha256sum file1 file2`

### Archiving and Compression
- Create a tarball: `tar -cvf archive.tar files/`
- Extract a tarball: `tar -xvf archive.tar`
- Create a compressed tar.gz: `tar -czvf archive.tar.gz files/`
- Extract a tar.gz: `tar -xzvf archive.tar.gz`
- Create a bzip2 archive: `tar -cjvf archive.tar.bz2 files/`
- Extract a bzip2 archive: `tar -xjvf archive.tar.bz2`
- List tar content: `tar -tvf archive.tar`
- Zip files: `zip archive.zip file1 file2`
- Unzip files: `unzip archive.zip`
- Compress with gzip: `gzip file.txt`
- Decompress gzip: `gunzip file.txt.gz`

### File Transfers and Downloads
- Download file from URL: `wget http://example.com/file.zip`
- Download file with curl: `curl -O http://example.com/file.zip`
- Copy file to remote server (SCP): `scp file.txt user@host:/path`
- Copy directory to remote server: `scp -r dir user@host:/path`
- Synchronize files locally (rsync): `rsync -av source/ dest/`
- Synchronize files with remote (rsync): `rsync -avz local/ user@host:/remote/`

### File Permissions and Ownership
- Change file owner: `chown user file.txt`
- Change file group: `chgrp group file.txt`
- Change owner and group: `chown user:group file.txt`
- Change permissions (symbolic): `chmod u+x file.sh`
- Change permissions (numeric): `chmod 644 file.txt`
- Recursive permission change: `chmod -R 755 directory/`
- Set SUID bit: `chmod u+s file`
- Set SGID bit: `chmod g+s directory`
- Set sticky bit: `chmod +t directory`

### Disk Usage and Space
- Show disk space usage: `df -h`
- Show directory size: `du -sh directory/`
- Sort subdirectories by size: `du -h --max-depth=1 | sort -h`
- Check file system type: `df -T`

### Advanced File Manipulation
- Combine files: `cat file1 file2 > combined.txt`
- Append file to another: `cat file1 >> file2`
- Split a large file: `split -b 100M largefile segment_`
- Merge split files: `cat segment_* > restored_file`
- Create file with specific size: `truncate -s 10M empty_file`
- Shred a file (secure delete): `shred -u file.txt`
- Count lines, words, chars: `wc file.txt`
- Sort lines in a file: `sort file.txt`
- Remove duplicate lines: `sort file.txt | uniq`
- Only show unique lines: `uniq -u file.txt`
- Show duplicated lines: `uniq -d file.txt`
- Extract columns (cut): `cut -d',' -f1 file.csv`
- Replace characters (tr): `tr 'a-z' 'A-Z' < file.txt`
- Base64 encode: `base64 file.txt > file.b64`
- Base64 decode: `base64 -d file.b64 > file.txt`
- Hex dump: `hexdump -C file.bin`
- View binary strings: `strings file.bin`
- Tee output to file and stdout: `command | tee output.txt`
- Watch command output: `watch -n 1 ls -l`
- Change file timestamps: `touch -t 202301010000 file.txt`
- Check file integrity (SHA1): `sha1sum file.txt`
- Compare three files: `diff3 file1 file2 file3`
- Patch a file: `patch file.txt < changes.patch`
- Reverse a patch: `patch -R file.txt < changes.patch`
- Clear file content: `> file.txt`
- List open files: `lsof`
- Find which process uses a file: `fuser file.txt`
- Monitor file system events: `inotifywait -m /path`
- Rename files using patterns (mmv): `mmv "*.old" "#1.new"`
- Mount a filesystem: `mount /dev/sdb1 /mnt`
- Unmount a filesystem: `umount /mnt`
- Create a loopback device: `losetup /dev/loop0 image.img`
- List block devices: `lsblk`
- Show file system label/UUID: `blkid`
- Change file attributes (immutable): `chattr +i file.txt`
- List file attributes: `lsattr file.txt`
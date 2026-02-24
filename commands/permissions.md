# Permissions and User Management Commands

### Basic File Permissions (chmod)
- Change permissions to read/write/execute for owner, read/execute for group and others: `chmod 755 file.sh`
- Set read/write for owner and read-only for others (numeric): `chmod 644 file.txt`
- Set read/write for owner and group (numeric): `chmod 660 file.txt`
- Grant execute permission to owner: `chmod u+x file.sh`
- Grant read/write permissions to owner and group: `chmod ug+rw file.txt`
- Remove write permission for others: `chmod o-w file.txt`
- Add execute permission for everyone: `chmod +x script.sh`
- Set identical permissions for group as owner: `chmod g=u file.txt`
- Recursive permission change: `chmod -R 755 directory/`
- Change permissions for directories only recursively: `find . -type d -exec chmod 755 {} +`
- Change permissions for files only recursively: `find . -type f -exec chmod 644 {} +`
- Reference permissions from another file: `chmod --reference=ref_file.txt target_file.txt`
- Show verbose output for permission changes: `chmod -v 755 file.sh`
- Show output only if changes are made: `chmod -c 755 file.sh`
- Suppress error messages: `chmod -f 755 file.sh`

### Ownership and Group Management (chown, chgrp)
- Change file owner: `chown user file.txt`
- Change file group: `chgrp group file.txt`
- Change owner and group: `chown user:group file.txt`
- Change owner and group (dot notation): `chown user.group file.txt`
- Change group only using chown: `chown :group file.txt`
- Change owner recursively: `chown -R user directory/`
- Reference owner/group from another file: `chown --reference=ref_file.txt target_file.txt`
- Change owner only if it matches current owner: `chown --from=olduser newuser file.txt`
- Change owner of a symbolic link (not target): `chown -h user symlink`
- Show verbose output for ownership changes: `chown -v user:group file.txt`
- List group members: `getent group groupname`
- Show current user's groups: `groups`
- Show groups for a specific user: `groups username`
- Show user and group IDs: `id`
- Show UID for a user: `id -u username`
- Show GID for a user: `id -g username`

### User Management
- Create a new user: `sudo useradd username`
- Create user with home directory: `sudo useradd -m username`
- Create user with specific shell: `sudo useradd -s /bin/bash username`
- Create user with specific UID: `sudo useradd -u 1500 username`
- Create user with expiry date: `sudo useradd -e 2025-12-31 username`
- Create a system user (no home): `sudo useradd -r username`
- Delete a user: `sudo userdel username`
- Delete user and home directory: `sudo userdel -r username`
- Modify user's login name: `sudo usermod -l newname oldname`
- Lock a user account: `sudo usermod -L username`
- Unlock a user account: `sudo usermod -U username`
- Set account expiry date: `sudo usermod -e 2025-12-31 username`
- Move home directory to new location: `sudo usermod -m -d /new/home username`
- Add user to a supplementary group: `sudo usermod -aG groupname username`
- Change user's primary group: `sudo usermod -g groupname username`
- List all users: `cat /etc/passwd`
- Show user account aging info: `chage -l username`
- Set password to expire in 30 days: `sudo chage -M 30 username`
- Force user to change password at next login: `sudo chage -d 0 username`

### Group Management
- Create a new group: `sudo groupadd groupname`
- Create group with specific GID: `sudo groupadd -g 1500 groupname`
- Delete a group: `sudo groupdel groupname`
- Rename a group: `sudo groupmod -n newname oldname`
- Change group GID: `sudo groupmod -g 2000 groupname`
- Add user to group: `sudo gpasswd -a username groupname`
- Remove user from group: `sudo gpasswd -d username groupname`
- Set group administrators: `sudo gpasswd -A user1,user2 groupname`
- List all groups: `cat /etc/group`
- Check group file consistency: `grpck`
- Check passwd file consistency: `pwck`

### Special Permissions (SUID, SGID, Sticky Bit)
- Set SUID bit (symbolic): `chmod u+s file`
- Set SUID bit (numeric): `chmod 4755 file`
- Remove SUID bit: `chmod u-s file`
- Set SGID bit on directory (symbolic): `chmod g+s directory`
- Set SGID bit on directory (numeric): `chmod 2775 directory`
- Remove SGID bit: `chmod g-s directory`
- Set Sticky Bit on directory (symbolic): `chmod +t directory`
- Set Sticky Bit on directory (numeric): `chmod 1777 directory`
- Remove Sticky Bit: `chmod -t directory`
- Find SUID files: `find / -perm /4000 -type f`
- Find SGID files: `find / -perm /2000 -type f`
- Find world-writable files: `find / -perm -0002 -type f`

### Access Control Lists (ACLs)
- View ACLs of a file: `getfacl file.txt`
- Set read/write ACL for a user: `setfacl -m u:username:rw file.txt`
- Set read-only ACL for a group: `setfacl -m g:groupname:r file.txt`
- Remove specific ACL entry: `setfacl -x u:username file.txt`
- Remove all ACL entries: `setfacl -b file.txt`
- Set default ACL for a directory: `setfacl -d -m u:username:rwx directory/`
- Copy ACL from one file to another: `getfacl file1 | setfacl --set-file=- file2`
- Recursive ACL application: `setfacl -R -m u:username:rwx directory/`
- Set ACL for "others": `setfacl -m o::- file.txt`
- Set ACL for the "mask": `setfacl -m m::rx file.txt`

### Extended Attributes (chattr, lsattr)
- List file attributes: `lsattr file.txt`
- Make file immutable (cannot delete/modify): `sudo chattr +i file.txt`
- Remove immutable attribute: `sudo chattr -i file.txt`
- Append-only attribute (can only add text): `sudo chattr +a file.txt`
- Remove append-only attribute: `sudo chattr -a file.txt`
- Set compressed attribute: `sudo chattr +c file.txt`
- Set "no dump" attribute: `sudo chattr +d file.txt`
- Set secure deletion attribute: `sudo chattr +s file.txt`
- Set synchronous updates attribute: `sudo chattr +S file.txt`

### Password and Account Security
- Change current user's password: `passwd`
- Change another user's password: `sudo passwd username`
- Delete user's password (makes account passwordless): `sudo passwd -d username`
- Lock user's password: `sudo passwd -l username`
- Show password status: `sudo passwd -S username`
- List all password hashes (secure): `sudo cat /etc/shadow`
- Check password strength (if library installed): `pwscore`
- Generate a random password: `openssl rand -base64 12`
- Switch to another user: `su - username`
- Switch to root: `su -`
- Logout of current session: `logout`

### Sudo and Privileged Access
- Execute command as root: `sudo command`
- Execute command as another user: `sudo -u username command`
- Edit sudoers file safely: `sudo visudo`
- List current user's sudo privileges: `sudo -l`
- Refresh sudo timestamp: `sudo -v`
- Kill sudo session (invalidate timestamp): `sudo -k`
- Run shell as root: `sudo -i`
- Show version of sudo: `sudo -V`

### System Auditing and Logging
- Show last logged-in users: `last`
- Show last failed login attempts: `lastb`
- Show last login of all users: `lastlog`
- Show who is currently logged in: `who`
- Show who is logged in and what they are doing: `w`
- Show current username: `whoami`
- Show details of the current terminal: `who am i`
- View system auth logs (Debian/Ubuntu): `sudo tail /var/log/auth.log`
- View system auth logs (RHEL/CentOS): `sudo tail /var/log/secure`
- Search auth logs for failed logins: `grep "Failed password" /var/log/auth.log`
- Monitor logins in real-time: `sudo tail -f /var/log/auth.log`

### Environment and Umask
- Show current umask: `umask`
- Set umask to 022: `umask 022`
- Set umask (symbolic): `umask -S`
- Show environment variables: `env`
- Show specific environment variable: `printenv PATH`
- List all aliases: `alias`
- Show limit on system resources: `ulimit -a`

### SELinux and AppArmor (Basic)
- Show SELinux status: `sestatus`
- List SELinux context of files: `ls -Z`
- Change SELinux context: `chcon -t httpd_sys_content_t file.txt`
- Restore default SELinux context: `restorecon -v file.txt`
- Enable SELinux temporarily: `sudo setenforce 1`
- Disable SELinux temporarily: `sudo setenforce 0`
- Show AppArmor status: `sudo aa-status`
- Put AppArmor profile in complain mode: `sudo aa-complain /path/to/bin`
- Put AppArmor profile in enforce mode: `sudo aa-enforce /path/to/bin`
- Reload AppArmor profile: `sudo apparmor_parser -r /etc/apparmor.d/profile_name`

# 🧪 RHCSA Lab Tasks for Interns (AlmaLinux / RHEL 9)

> These labs are hands-on, practical tasks that match the training guide. Use these in a VM or test environment. Break stuff and learn to fix it!

---

## ✅ Day 2-3 Labs: Shell & Navigation

### 1. Navigate and Manipulate Files
- Create `/home/student/testdir` and navigate into it
- Create three files: `file1`, `file2`, `file3`
- Copy `file1` to `backup1`, then rename `file2` to `notes.txt`
- Delete `file3`

### 2. Permissions & Ownership
- Create user `devuser`, group `devs`
- Add `devuser` to `devs`
- Change ownership of `notes.txt` to `devuser:devs`
- Give read-only permissions to group, no access to others

### 3. Search & View
- Use `grep` to find lines containing "error" in `/var/log/messages`
- Use `find` to locate all `.conf` files in `/etc`

---

## ✅ Day 4-5 Labs: Users & Access Control

### 4. User Management
- Create user `intern1` with `/bin/bash` as shell
- Set password to expire in 10 days

### 5. Sudo & ACL
- Add `intern1` to `wheel` group for sudo access
- Create `/secure/data.txt`, and give `intern1` read-only ACL access

---

## ✅ Day 6-7 Labs: Disks & LVM

### 6. Mounting Disks
- Attach a new 2GB virtual disk to your VM
- Partition it with `fdisk`, format it as `xfs`, and mount it to `/mnt/testdisk`

### 7. LVM
- Create a physical volume from the new disk
- Create volume group `vg_test`, logical volume `lv_data`
- Mount it on `/data`, extend it by 500MB, and resize

### 8. Swap
- Create a 1GB swap file at `/swapfile`
- Enable it and add it to `/etc/fstab`

---

## ✅ Day 8-9 Labs: Services & Logs

### 9. Services
- Start and enable the `sshd` service
- Check status, stop and restart it

### 10. Logs
- Use `journalctl` to filter logs for `sshd`
- Create a custom message with `logger` and verify it appears in the logs

---

## ✅ Day 10-11 Labs: Networking & Security

### 11. Networking
- Use `nmcli` to assign static IP `192.168.100.10/24` to your NIC
- Set hostname to `intern-lab`

### 12. SSH + Firewall
- Configure SSH key-based auth for `intern1`
- Open SSH port with `firewall-cmd` and make it permanent

### 13. SELinux
- Create `/web/index.html`, serve it via `httpd`
- Adjust SELinux to allow Apache to read this directory

---

## ✅ Day 12-13 Labs: Scripting & Backup

### 14. Bash Script
- Write a script `userinfo.sh` that prints:
  - Current user
  - Disk usage of `/home`
  - Date and uptime

### 15. Cron Job
- Schedule a cron job to run `userinfo.sh` every day at 7am

### 16. Backup
- Create a backup script using `tar` that backs up `/etc` to `/backup/etc_backup.tar.gz`

---

## 🏁 Day 14 Labs: Final Practice

- Break `/etc/fstab`, reboot into rescue mode and fix it
- Disable the network via `nmcli`, then bring it back manually
- Create a snapshot of your logical volume, write to it, then restore

---

> 💡 Tip: Keep a lab log or Git repo of what you did. Version control your scripts and notes like a real sysadmin!


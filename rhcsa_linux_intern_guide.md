# 🧑‍🏫 RHCSA-Aligned Linux Intern Guide (AlmaLinux / RHEL 9)

Welcome!

![Sticker](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExMjVuNWtraHE5ZXM0ZmM5bGx6aTdhOHFpd3EwY2tkY3F0aTU4Y2ZoNCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/FemTGpEZeK27M5fKL4/giphy.gif)

This guide is structured to walk you through **real-world Linux skills** that are **actually used in the field** and helping you understand not just *what* to learn but *why* it matters.

---

## ✅ Day 1–2: Foundation & Everyday Survival Skills

> _"These are the commands you'll use every day. No matter what job you do in Linux, this is your bread and butter."_

### 🔹 File Navigation & Shell Basics
- `cd`, `pwd`, `ls`, `clear`, `exit`
- Why? Navigating the file system is like walking around your office. You need to know where things are.

### 🔹 File Management
- `cp`, `mv`, `rm`, `mkdir`, `touch`
- Why? You'll be copying logs, renaming config files, deleting junk, creating folders for projects.

### 🔹 View Files
- `cat`, `less`, `head`, `tail`, `sort`, `wc`
- Why? You need to **read logs**, configs, and scripts. Quick viewing is a core troubleshooting skill.

### 🔹 Permissions & Ownership
- `chmod`, `chown`, `chgrp`
- Why? Security. No one wants the wrong user modifying critical files. You'll need this in real-world multi-user systems.

### 🔹 Search & Locate
- `find`, `grep`, `locate`, `which`, `type`
- Why? When systems grow, so do files. You can’t manually look through 10,000+ logs. These save hours.

### 🔹 Text Processing (Intro)
- `cut`, `awk`, `sed`, `sort`, `uniq`, `tr`
- Why? Logs and outputs often need cleanup or extraction. These tools help automate manual parsing.

### 🔹 Environment Variables
- `printenv`, `export`, `PATH`, `~/.bashrc`, `~/.bash_profile`
- Why? You’ll often need to modify system behavior (e.g., setting Java path). Also useful for scripting.

---

## ✅ Day 3-4: Users, Groups & Access Control

> _"Your system isn't just you. It's developers, DBAs, analysts... and you need to manage their access properly."_

### 🔹 User Management
- `useradd`, `usermod`, `passwd`, `userdel`
- Why? You'll regularly onboard new users or decommission old ones.

### 🔹 Group Management
- `groupadd`, `usermod -aG`, `gpasswd`
- Why? Permissions are often managed at the group level, especially in team-based environments.

### 🔹 Sudo & Privileges
- `visudo`, `/etc/sudoers`, `wheel` group
- Why? You can't give root access to everyone. Sudo keeps it secure and auditable.

### 🔹 Password Policies
- `chage`, `passwd -e`, `/etc/login.defs`
- Why? For compliance. Password expiry and complexity is often mandated.

### 🔹 File ACLs
- `setfacl`, `getfacl`
- Why? Sometimes basic `chmod` isn’t enough. You need finer control (e.g., give a dev read access to prod logs).

---

## ✅ Day 5–6: Storage & LVM

> _"Storage problems can take down apps fast. LVM gives you flexibility you’ll thank yourself for later."_

### 🔹 Partitioning & Filesystems
- `lsblk`, `fdisk`, `parted`, `mkfs`, `mount`, `umount`
- Why? You’ll often add new disks for DBs, logs, apps.

### 🔹 fstab for Auto-mounting
- `/etc/fstab`, UUIDs, Labels
- Why? After reboot, your mounts shouldn't disappear. This is standard practice.

### 🔹 LVM: Logical Volume Manager
- `pvcreate`, `vgcreate`, `lvcreate`, `lvextend`, `xfs_growfs`
- Why? LVM lets you resize partitions on the fly, take snapshots, and avoid downtime.

### 🔹 Swap Management
- `mkswap`, `swapon`, `swapoff`, `free`, `/etc/fstab`
- Why? When memory is low, swap saves you from crashing.

---

## ✅ Day 7-8: System Boot, Logs & Services

> _"When something breaks, logs and services are your best friends."_

### 🔹 systemd Basics
- `systemctl`, `journalctl`, service unit files
- Why? Everything in RHEL uses systemd now. You’ll manage services and check logs via these.

### 🔹 Boot Process & Targets
- `grubby`, `systemctl get-default`, kernel params
- Why? Recovery and debugging start at boot. You need to know how to switch to rescue mode.

### 🔹 Logs
- `journalctl`, `/var/log/messages`, `logger`
- Why? All troubleshooting starts with logs. Period.

---

## ✅ Day 9-10: Networking & Security

> _"A system with no network is a brick. And an insecure one is a breach waiting to happen."_

### 🔹 Network Config
- `nmcli`, `nmtui`, `ip`, `hostnamectl`
- Why? You'll configure static IPs, DNS, hostnames often in the field.

### 🔹 SSH Setup
- `sshd_config`, `systemctl`, `firewalld`, `ssh-keygen`, `ssh-copy-id`
- Why? Remote access is critical. You need it secure and working.

### 🔹 Firewall
- `firewall-cmd`, zones, ports, services
- Why? Exposing services like DBs and SSH to public is a huge risk. Learn to lock it down.

### 🔹 SELinux
- `getenforce`, `setenforce`, `semanage`, `restorecon`
- Why? SELinux can block services silently. Learn to troubleshoot it instead of disabling it blindly.

---

## ✅ Day 11-12: Automation, Backup & Practice

> _"This is what separates you from a script-kiddie. Automate, practice, break and fix."_

### 🔹 Shell Scripting
- `#!/bin/bash`, variables, conditionals, loops, arguments
- Why? Automate backups, monitoring, health checks, deployments.

### 🔹 Cron & At
- `crontab`, `cron.d`, `at`, `systemd timers`
- Why? Scheduled jobs are a huge part of systems (backups, reports, syncs).

### 🔹 Backups
- `tar`, `scp`, `rsync`
- Why? Always assume something will break. Backups = insurance.

---

## ✅ Day 13-14: Refresh Practice
> _"Set up practice challenges: Add disk, mount with LVM, set ACLs, create a backup job, reboot to rescue mode and fix fstab errors."_

---

## 📘 Final Tips
- Use `man` and `--help`. Don't memorize, **understand**.
- Break things in lab. Learn to recover.
- Think like an admin: "How would I secure, automate, and maintain this for a year?"
- Don't skip SELinux or firewalld. They're there in every prod server.

---

📍 **Next Steps**
- Start labbing. VirtualBox, VMware, or remote AlmaLinux VM will work.
- Ask questions. Learn by doing.

You got this. 💪


# Linux Ask Yourself: Logs, Monitoring & Security

## Linux Logs and Event Monitoring

### What is the purpose of system logs in Linux?

System logs in Linux record events, errors, and system status information. They help system administrators track the system's health, troubleshoot issues, monitor security events, and investigate incidents.

### Can you name a few important log files and their locations?

- `/var/log/syslog` or `/var/log/messages` – General system logs
- `/var/log/auth.log` or `/var/log/secure` – Authentication logs
- `/var/log/kern.log` – Kernel logs
- `/var/log/dmesg` – Boot and hardware logs
- `/var/log/cron` – Cron job logs
- `/var/log/apache2/access.log` or `/var/log/httpd/access_log` – Web server logs

### A user reports failed login attempts. Which log file would you check?

Check `/var/log/auth.log` (or `/var/log/secure`). Use:

```bash
grep "Failed password" /var/log/auth.log
```

### How to monitor a log file in real-time?

```bash
tail -f /var/log/auth.log
```

To filter for suspicious activity:

```bash
tail -f /var/log/auth.log | grep "failed"
```

### How to identify if a cron job failed?

```bash
grep "error" /var/log/cron
```

---

## Log Management and Analysis

### Search for the word "error" in a log file:

```bash
grep "error" /path/to/logfile
```

### View the last 50 lines of a log file:

```bash
tail -n 50 /path/to/logfile
```

### What is logrotate?

`logrotate` manages log files by rotating, compressing, and deleting them to control size and preserve disk space. It is essential for maintaining system performance.

---

## User and Session Monitoring

### List currently logged-in users:

```bash
who
```

*or*

```bash
w
```

### Find login attempt history:

Use `last`, or check:

```bash
cat /var/log/auth.log
```

### What are utmp, wtmp, and btmp?

- `utmp` – Info about current logins
- `wtmp` – Login/logout history
- `btmp` – Failed login attempts

---

## Process and Network Monitoring

### List all running processes:

```bash
ps aux
```

### Find ports used by processes:

```bash
netstat -tuln
# or
ss -tuln
```

### Identify bandwidth-consuming processes:

```bash
iftop
# or
nload
# or
netstat -anp
```

---

## Security Configurations

### How to secure an SSH server?

- Change default port in `/etc/ssh/sshd_config`
- Disable root login: `PermitRootLogin no`
- Use key-based authentication
- Restrict access with `AllowUsers` or `AllowGroups`

### Significance of `/etc/ssh/sshd_config`

This file configures the SSH daemon including authentication, port settings, and access control policies.

### Check file permissions:

```bash
ls -l /path/to/file
```

### Difference between chmod, chown, and chattr:

- `chmod`: Change file permissions
- `chown`: Change file ownership
- `chattr`: Change file attributes (e.g., `+i` makes a file immutable)

---

## Scenario-Based Questions

### Web server log shows many 404 errors. What to do?

- Check log paths for missing or incorrect resources
- Investigate for scanning attempts or misconfigured URLs
- Review web server configuration

### Suspected privilege escalation. What logs to check?

- Check `/var/log/auth.log` or `/var/log/secure`
- Use `last` and `lastb` to check session history
- Look for suspicious `sudo` or `su` usage

### Suspected rootkit infection. How to detect?

- Use `chkrootkit` or `rkhunter`
- Check for unusual processes, files, or ports using:

```bash
ps aux
netstat -tulnp
lsof
```



Linux Logs and Event Monitoring
What is the purpose of system logs in Linux?

System logs in Linux record events, errors, and system status information. They help system administrators track the system's health, troubleshoot issues, monitor security events, and investigate incidents.
Can you name a few important log files and their locations on a Linux system?

/var/log/syslog or /var/log/messages – General system logs.
/var/log/auth.log or /var/log/secure – Authentication logs.
/var/log/kern.log – Kernel logs.
/var/log/dmesg – Boot and hardware logs.
/var/log/cron – Cron job logs.
/var/log/apache2/access.log or /var/log/httpd/access_log – Web server logs.
A user reports failed login attempts. Which log file would you check, and how?

You would check /var/log/auth.log (or /var/log/secure on some systems). You can use the grep command to search for failed login attempts, e.g.,
grep "Failed password" /var/log/auth.log
How would you monitor a log file in real-time to identify suspicious activities?

You can use tail -f /var/log/auth.log to view the log file in real-time. For more complex filtering, you can pipe it through grep, like tail -f /var/log/auth.log | grep "failed".
How would you identify if a particular cron job failed to execute?

Check /var/log/cron to view cron job activity. Use grep to filter for any errors, e.g., grep "error" /var/log/cron.
Log Management and Analysis
What command would you use to search for the word "error" in a log file?

Use the grep command:
grep "error" /path/to/logfile
How would you view the last 50 lines of a log file?

Use the tail command:
tail -n 50 /path/to/logfile
What is logrotate, and why is it important?

logrotate is a utility to manage log files. It rotates, compresses, and deletes logs to prevent them from growing too large. It's important for maintaining system performance and preventing logs from consuming too much disk space.
User and Session Monitoring
Which command would you use to list currently logged-in users?

Use the who or w command:
who or w
How can you find the history of login attempts on a Linux system?

Check /var/log/auth.log (or /var/log/secure) for login attempt records, or use the last command, which shows login history:
last
What are utmp, wtmp, and btmp files used for?
utmp – Stores information about currently logged-in users.
wtmp – Contains information about login and logout events.
btmp – Stores records of failed login attempts.
Process and Network Monitoring
How would you list all running processes on a Linux system?
Use the ps command with the aux options:
ps aux
Which command would you use to find out which ports are being used by which processes?
Use netstat or ss with appropriate options:
netstat -tuln or ss -tuln
If a server’s network is slow, how would you identify processes consuming bandwidth?
Use iftop or nload to monitor network bandwidth usage, or netstat to identify active connections.
iftop or netstat -anp
Security Configurations
How would you secure an SSH server to prevent unauthorized access?
Change the default SSH port (in /etc/ssh/sshd_config), disable root login (PermitRootLogin no), use SSH key-based authentication instead of passwords, and configure AllowUsers or AllowGroups for user-specific access.
What is the significance of the /etc/ssh/sshd_config file?
The /etc/ssh/sshd_config file contains configuration settings for the SSH daemon, such as authentication methods, port numbers, and security-related settings like disabling root login.
How would you check the permissions of a file?
Use the ls -l command to display file permissions:
ls -l /path/to/file
Explain the difference between chmod, chown, and chattr.
chmod – Changes file permissions (e.g., chmod 755 file).
chown – Changes file ownership (e.g., chown user:user file).
chattr – Changes file attributes (e.g., chattr +i file to make a file immutable).
Scenario-Based Questions
A web server log shows a high number of 404 errors. What steps would you take to investigate?
Investigate the URL paths in the log to see if they correspond to legitimate resources or attacks like path traversal. Check the configuration of the web server for any missing resources or misconfigurations.
You suspect that a user is escalating privileges on a Linux system. Which logs would you examine to confirm this?
Check /var/log/auth.log or /var/log/secure for suspicious sudo or su commands. Use last and lastb to check for login/logout events and failed login attempts.
If you suspect a rootkit is installed on a Linux system, how would you go about detecting and verifying it?
Use rootkit detection tools like chkrootkit or rkhunter to scan for known rootkits. Inspect unusual files, processes, and network connections using commands like ps aux, netstat, and lsof.

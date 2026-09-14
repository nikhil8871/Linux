#!/bin/bash

cleanpath="/var/log/"

find $cleanpath -name "*.log" -mtime +1 -type f -exec gzip   {} \;

find $cleanpath -name "*.gz" -mtime +2 -type f -exec rm -rf {} \;



We have 2 services which are collecting logs
a) systemd.journald: collect all logs in a file, stores logs at /var/log/journal.
b) rsyslog: takes the logs from systemd.journald and seperate it according to the services, system logs and application logs. Stores the  logs at /var/log/


We have 2 option:
1) Install logrotate utility for delete the older logs:
a) logrotate has its configuration file at /etc/logrotate.conf
b) Application level log file configuration is at /etc/logrotate.d/

2) making our customer script:
a) create anywhere.
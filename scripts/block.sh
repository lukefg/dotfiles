#!/bin/bash
# Block websites by redirecting to localhost

TARGET_IP=0.0.0.0
INPUT_FILE="../blocklist.txt"
HOSTS_FILE="/etc/hosts"

sudo echo >> $HOSTS_FILE
sudo echo "# === BLOCKED WEBSITES ===" >> $HOSTS_FILE
while read line
do
	echo "Blocking sites ${line}"
	sudo echo "${TARGET_IP} ${line}" >> $HOSTS_FILE
done < $INPUT_FILE
sudo echo >> $HOSTS_FILE

sudo dscacheutil -flushcache

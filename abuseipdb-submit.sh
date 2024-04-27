#!/bin/ash
# For the latest script, reference https://github.com/kamsalisbury/OpenWRT-AbuseIPDB
# Dependencies: Firewall, WAN Input must have logging enabled (default is disabled)
#               Router configured to use UTC time.
logread -Z 3 \
| grep DPT \
| awk '{print $16, $25, $5, $2, $3, $4}' \
| grep DPT \
| awk '{gsub(/SRC=|DPT=/, ""); print}' \
| awk '!seen[$1]++' \
| sed 's/Jan/01/g' \
| sed 's/Feb/02/g' \
| sed 's/Mar/03/g' \
| sed 's/Apr/04/g' \
| sed 's/May/05/g' \
| sed 's/Jun/06/g' \
| sed 's/Jul/07/g' \
| sed 's/Aug/08/g' \
| sed 's/Sep/09/g' \
| sed 's/Oct/10/g' \
| sed 's/Nov/11/g' \
| sed 's/Dec/12/g' \
| sed 's/ 1 / 01 /g' \
| sed 's/ 2 / 02 /g' \
| sed 's/ 3 / 03 /g' \
| sed 's/ 4 / 04 /g' \
| sed 's/ 5 / 05 /g' \
| sed 's/ 6 / 06 /g' \
| sed 's/ 7 / 07 /g' \
| sed 's/ 8 / 08 /g' \
| sed 's/ 9 / 09 /g' \
| awk '{print "curl https://api.abuseipdb.com/api/v2/report \-\-data\-urlencode ip\="$1 " \-d categories\=14 \-\-data\-urlencode \"comment\=Portscan "$2"\" \-\-data\-urlencode \"timestamp\="$3"\-"$4"\-"$5"T"$6"+00:00\" \-H \"Key: <Your AbuseIPDB API Key>\" \-H \"Accept: application/json\""}' \
| sh

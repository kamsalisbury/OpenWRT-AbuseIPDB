#!/bin/ash

# The following variable does not work from inside the awk statements as written.
# The current OpenWRT date format is a calendar month instead of a numeric month.
# Have to create a conversion from calendar month to numeric to achieve full automation. 
month=$(date +%m)

logread -Z 3 \
| grep DPT \
| awk '{print $15, $24, $5, $3, $4}' \
| grep DPT \
| awk '{gsub(/SRC=|DPT=/, ""); print}' \
| awk '!seen[$1]++' \
| awk '{print "curl https://api.abuseipdb.com/api/v2/report \-\-data\-urlencode ip\="$1 " \-d categories\=14 \-\-data\-urlencode \"comment\=Portscan "$2"\" \-\-data\-urlencode \"timestamp\="$3"\-02\-"$4"T"$5"-05:00\" \-H \"Key: <AbuseIPDB API v2 key>\" \-H \"Accept: application/json\""}' \
| sh

# OpenWRT uses syslogd to a ring buffer, so the log will rollover when the buffer fills up.
# On my system the rollover happens aproximately every hour and half. YMMV.

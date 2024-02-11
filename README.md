# OpenWRT-AbuseIPDB
A purposely simplified script to report port scans to AbuseIPDB

## Dependencies
No extra packages required.

## Installation
1. Copy the script to your OpenWRT device.
2. Edit the second to the last line of the script, inputting your <AbuseIPDB API Key> from [https://www.abuseipdb.com/account/api](https://www.abuseipdb.com/account/api)
3. [Edit the crontab](https://www.redhat.com/sysadmin/linux-cron-command) to execute the script at least [once per a day](https://crontab.guru/once-a-day).
4. Optional: [Add the AbsueIPDB verfication code to your website](https://www.abuseipdb.com/account/webmasters).

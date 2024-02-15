# OpenWRT-AbuseIPDB
A purposely simplified script to report port scans to AbuseIPDB

## Dependencies
1. No extra packages required. Only default [ash shell}(https://openwrt.org/docs/guide-user/base-system/user.beginner.cli), awk and sed utiltites are used.
2. One firewall configuration change. By default, the WAN->Reject firewall rule, does not log blocked packets. [Enable logging blocked packets](https://openwrt.org/docs/guide-user/firewall/firewall_configuration) via https://<router ip>/cgi-bin/luci/admin/network/firewall (or via command prompt; firewall.@zone[1].log='1')

## Installation
1. Copy the script to your OpenWRT device.
2. Edit the second to the last line of the script, inputting your <AbuseIPDB API Key> from [https://www.abuseipdb.com/account/api](https://www.abuseipdb.com/account/api)
3. [Edit the crontab](https://www.redhat.com/sysadmin/linux-cron-command) to execute the script at least [once per a day](https://crontab.guru/once-a-day).
4. Optional: [Add the AbsueIPDB verfication code to your website](https://www.abuseipdb.com/account/webmasters).

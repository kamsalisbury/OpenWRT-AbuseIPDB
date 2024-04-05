# OpenWRT-AbuseIPDB
A purposely simplified script to report port scans to [AbuseIPDB](https://www.abuseipdb.com/user/26499).

Emphasizing efficiency, everything happens in RAM.

No temporary files to cause degraded flash storage.

Tested on [GL.iNet](https://www.gl-inet.com/) Brume2, an Arm processor Ash Shell based firewall.

Implementation artifacts at [https://kamsalisbury.github.io/code/arm/shell/2024/02/11/OpenWRT-AbuseIPDB/](https://kamsalisbury.github.io/code/arm/shell/2024/02/11/OpenWRT-AbuseIPDB/)

### Disclaimer: Modifying firewall-router operation is an advanced configuration. You are ultimately responsible for the security and operation of your network and devices, regardless of any advice-post-script on the Internet or anywhere. 

## Dependencies
1. No extra packages required. Only the default [ash shell](https://openwrt.org/docs/guide-user/base-system/user.beginner.cli), awk and sed utiltites are used.
2. One firewall configuration change. By default, the "WAN->Reject firewall rule" does not log blocked packets. [Enable logging blocked packets](https://openwrt.org/docs/guide-user/firewall/firewall_configuration) via https://your-router-ip/cgi-bin/luci/admin/network/firewall (or via command prompt; uci set firewall.@zone[1].log='1')

## Installation
1. Copy the script to your OpenWRT device.
2. Edit the second to the last line of the script, inputting your "AbuseIPDB API Key" from [https://www.abuseipdb.com/account/api](https://www.abuseipdb.com/account/api)
3. Edit the second to the last line of the script, modifying the last portion of the timestamp value to reflect the correct time zone configuration for the router's location (or configure the router to use UTC and set the last portion of the timestamp value to -00:00)
4. [Edit the crontab](https://www.redhat.com/sysadmin/linux-cron-command) to execute the script at least [once per a day](https://crontab.guru/once-a-day).
5. Optional: [Add the AbsueIPDB verfication code to your website](https://www.abuseipdb.com/account/webmasters).

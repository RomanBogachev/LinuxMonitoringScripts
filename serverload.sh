#!/bin/sh
r=$(cat /proc/loadavg | awk -F. '{print $1}')
if [ $r -ge 50 ]
then
/bin/mail -s "Warning: High Server Load on: `hostname -i` Load Average: $r"     mail@example.com
fi
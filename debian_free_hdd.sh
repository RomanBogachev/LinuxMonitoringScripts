#!/bin/sh
used=`df -h | grep sda | awk {'print $5'}`
used=${used/\%/}
if [ $used -gt 90 ];
then
echo "ВНИМАНИЕ!!!  На диске осталось меньше 10% свободного места. Занято = $used"% | mail -s "DISK ALERT" mail@example.com
fi
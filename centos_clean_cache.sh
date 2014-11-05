#!/bin/sh
freememory="$(free -m | grep "Mem:" | awk '{ print $4 }')";
if [ $freememory -lt 200 ]
        then
                var1="Свободной памяти:  $freememory, поэтому чистим\nОчистка оперативки на $(hostname -f)\nДата:\t$(date +%d.%m.%Y\ %H:%M:%S)\nОперативная память:\n-----------------------------------До выполнение задания.------------------------------------\n$(free -m)\n-----------------------------------После выполнение задания.---------------------------------\n\t"
        echo -e $var1;
sync
#Чистим pagecache: 
echo 1 > /proc/sys/vm/drop_caches
#Чистим dentrie и inode кэши: 
echo 2 > /proc/sys/vm/drop_caches
#Чистим pagecache, dentrie и inode кэши: 
echo 3 > /proc/sys/vm/drop_caches
sync
echo -e "$var1\n$(free -m)\n\nЗадание выполнено.\n\n\n-----------------------------------Проверка HDD свободного места---------------------------\n$(df -h)\n " | mail -s "Mamomory clear $(date +%d.%m.%Y\ %H:%M:%S)" alert@teamhostgroup.com 
echo "Очистка кеша выполнена."
exit
else
echo "Free Ram is:  $freememory, Free no need. Free only if -lt 200";
exit
fi
exit
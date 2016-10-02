integer max_count=10
backup_folder=/data/dontpanic
count_file=$backup_folder/next_count

if /system/bin/ls /mnt/pstore/console-ramoops ; then
    if /system/bin/ls $count_file ; then
        integer count=`/system/bin/cat $count_file`
        count=$count+0
        case $count in
            "" ) count=0
        esac
    else
        count=0
    fi
    echo [[[[ Written $backup_folder/ramoops$count $max_count ]]]]
    /system/bin/cat /mnt/pstore/console-ramoops > $backup_folder/ramoops$count
    /system/bin/cat /proc/cmdline >> $backup_folder/ramoops$count
    /system/bin/cat /proc/cmdline >> $backup_folder/cmdline$count
    # reason is att permission certification
    /system/bin/chmod -h 660 $backup_folder/ramoops$count
    /system/bin/chmod -h 660 $backup_folder/cmdline$count
    count=$count+1
    if  (($count>=$max_count)) ; then
        count=0
        echo restart
    fi
    echo $count > $count_file
    /system/bin/chmod -h 660 $count_file
fi
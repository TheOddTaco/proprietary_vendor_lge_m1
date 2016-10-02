#!/system/bin/sh

if [ $# -eq 0 ]
then
    echo "Wifi is using kernel module driver"
    rmmod wlan
else
    echo "Wifi is using kernel built-in driver"
    echo 0 > /sys/module/wlan/parameters/con_mode
fi

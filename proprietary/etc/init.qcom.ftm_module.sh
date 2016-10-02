#!/system/bin/sh
#this script unload normal wlan module and load FTM module

#LGE_CHANGE_S, 20111028, real-wifi@lge.com by Beaver, LGE will off wlan if wlan is on before call this.
#setprop ctl.stop wpa_supplicant
#rmmod wlan
#
# Check whether wlan module is loaded before load wlan driver for FTM.
#

if [ $# -eq 0 ]
then
    wlanmod=`lsmod`
    case "$wlanmod" in
        *wlan*)
            echo "WLAN module detected"
            setprop ctl.stop p2p_supplicant
            rmmod wlan
            sleep 1.5
            ;;
        *)
            echo "No WLAN module detected"
            ;;
    esac
    echo "Wifi is using kernel module driver"
    insmod /system/lib/modules/wlan.ko con_mode=5

else
    echo "Wifi is using kernel built-in driver"
    echo 5 > /sys/module/wlan/parameters/con_mode
fi

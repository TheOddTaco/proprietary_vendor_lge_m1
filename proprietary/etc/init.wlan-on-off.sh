#!/system/bin/sh
#this script load and unload normal WLAN module
bootmode=`getprop ro.factorytest`
case "$bootmode" in
    1)
        echo "Kernel Mode boot"
        sleep 2
        /system/bin/cpWlanIni
        /system/bin/insmod /system/lib/modules/prima/prima_wlan.ko
        sleep 1
        /system/bin/rmmod wlan
        ;;
    *)
        echo "Not Kernel Mode boot"
        ;;
esac

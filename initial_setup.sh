#!/system/xbin/busybox sh

# Mount /, /system as rw.
mount -o rw,remount /
mount -o rw,remount /system

# Install busybox.
/system/etc/install_busybox.sh

# Setup libs
/system/etc/setup_genericlibs.sh

# Setup MACs for BT and WiFi.
/system/etc/check_property.sh

# Remove this script.
rm /system/etc/initial_setup.sh

# Mount /, /system as ro.
mount -o ro,remount /system
mount -o ro,remount /


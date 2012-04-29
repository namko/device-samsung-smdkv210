#!/system/xbin/busybox sh

# Mount / as rw.
mount -o rw,remount /

# Install busybox.
/system/etc/install_busybox.sh

# Setup MACs for BT and WiFi.
/system/etc/check_property.sh

# Remove this script.
rm /system/etc/initial_setup.sh

# Mount / as ro.
mount -o ro,remount /


#!/system/xbin/busybox sh

# Install busybox. Remove "su" applet.
/system/xbin/busybox --install -s /system/xbin/
rm /system/xbin/su
ln -s /system/bin/su /system/xbin/su

# Setup owner permissions.
chown root.shell /system/bin/su
chmod 06755 /system/bin/su


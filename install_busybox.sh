#!/system/xbin/busybox sh

# Install busybox. Remove "su" applet.
/system/xbin/busybox --install -s /system/xbin/
rm /system/xbin/su
ln -s /system/bin/su /system/xbin/su

# Root.
chown 0.0 /system/bin/su
chmod 06755 /system/bin/su
chown 0.0 /system/app/Superuser.apk
chmod 0644 /system/app/Superuser.apk


#!/system/xbin/busybox sh

for MODULE in `busybox find /system/modules/ -name "*.ko"`
do
    insmod $MODULE
done

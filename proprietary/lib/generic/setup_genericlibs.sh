#!/system/xbin/busybox sh

cd /system/lib/generic

# Remove old symlinks.
find ./ -type l -exec rm {} \;

# Make all libs executable.
chmod 0755 *

# Create symlinks.
ln -s libBrokenLocale-2.10.1.so libBrokenLocale.so.1
ln -s libnss_files-2.10.1.so libnss_files.so.2
ln -s libresolv-2.10.1.so libresolv.so.2
ln -s libpthread-2.10.1.so libpthread.so.0
ln -s librt-2.10.1.so librt.so.1
ln -s libanl-2.10.1.so libanl.so.1
ln -s libm-2.10.1.so libm.so.6
ln -s libthread_db-1.0.so libthread_db.so.1
ln -s libnss_dns-2.10.1.so libnss_dns.so.2
ln -s libutil-2.10.1.so libutil.so.1
ln -s libgcc_s.so.1 libgcc_s.so
ln -s libcrypt-2.10.1.so libcrypt.so.1
ln -s libc-2.10.1.so libc.so.6
ln -s libnss_nisplus-2.10.1.so libnss_nisplus.so.2
ln -s libdl-2.10.1.so libdl.so.2
ln -s libnss_nis-2.10.1.so libnss_nis.so.2
ln -s libnsl-2.10.1.so libnsl.so.1
ln -s ld-2.10.1.so ld-linux.so.3
ln -s libcidn-2.10.1.so libcidn.so.1
ln -s libnss_compat-2.10.1.so libnss_compat.so.2
ln -s libnss_hesiod-2.10.1.so libnss_hesiod.so.2
ln -s libntfs-3g.so.83.0.0 libntfs-3g.so.83


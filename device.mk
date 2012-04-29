# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# This file is the device-specific product definition file for
# smdkv210. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Screen size is "large", density is "mdpi"
PRODUCT_AAPT_CONFIG := large mdpi

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/samsung/smdkv210/overlay

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# Generated kcm keymaps
PRODUCT_PACKAGES := \
 	s3c-button.kcm \
 	ft5x0x_ts.kcm \
	S5P_TouchScreen.kcm

# Init files
PRODUCT_COPY_FILES := \
	device/samsung/smdkv210/init.smdkv210.rc:root/init.smdkv210.rc \
	device/samsung/smdkv210/init.smdkv210.usb.rc:root/init.smdkv210.usb.rc \
	device/samsung/smdkv210/ueventd.smdkv210.rc:root/ueventd.smdkv210.rc

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
	device/samsung/smdkv210/vold.fstab:system/etc/vold.fstab \
	device/samsung/smdkv210/egl.cfg:system/lib/egl/egl.cfg

# Prebuilt kl and kcm keymaps + idc files.
PRODUCT_COPY_FILES += \
	device/samsung/smdkv210/ft5x0x_ts.kl:system/usr/keylayout/ft5x0x_ts.kl \
	device/samsung/smdkv210/ft5x0x_ts.kcm:system/usr/keychars/ft5x0x_ts.kcm \
	device/samsung/smdkv210/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
	device/samsung/smdkv210/s3c-button.kl:system/usr/keylayout/s3c-button.kl \
	device/samsung/smdkv210/s3c-button.kcm:system/usr/keychars/s3c-button.kcm \
	device/samsung/smdkv210/S5P_TouchScreen.kl:system/usr/keylayout/S5P_TouchScreen.kl \
	device/samsung/smdkv210/S5P_TouchScreen.kcm:system/usr/keychars/S5P_TouchScreen.kcm \
	device/samsung/smdkv210/S5P_TouchScreen.idc:system/usr/idc/S5P_TouchScreen.idc

# Busybox + scripts
PRODUCT_COPY_FILES += \
	device/samsung/smdkv210/su:system/bin/su \
	device/samsung/smdkv210/busybox:system/xbin/busybox \
	device/samsung/smdkv210/insmod.sh:system/etc/insmod.sh \
	device/samsung/smdkv210/check_property.sh:system/etc/check_property.sh \
	device/samsung/smdkv210/install_busybox.sh:system/etc/install_busybox.sh \
	device/samsung/smdkv210/initial_setup.sh:system/etc/initial_setup.sh

# Bluetooth setup
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# Wi-Fi
PRODUCT_COPY_FILES += \
	device/samsung/smdkv210/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	device/samsung/smdkv210/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/samsung/smdkv210/ar6000.ko:system/lib/modules/ar6000.ko \
	device/samsung/smdkv210/proprietary/wifi/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
	device/samsung/smdkv210/proprietary/wifi/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
	device/samsung/smdkv210/proprietary/wifi/fakeBoardData_AR6002.bin:system/wifi/fakeBoardData_AR6002.bin

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/smdkv210/secomxregistry:system/etc/secomxregistry \
	device/samsung/smdkv210/media_profiles.xml:system/etc/media_profiles.xml

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
	libSEC_OMX_Core \
	libOMX.SEC.AVC.Decoder \
	libOMX.SEC.M4V.Decoder \
	libOMX.SEC.M4V.Encoder \
	libOMX.SEC.AVC.Encoder

# Test utilites
PRODUCT_PACKAGES += \
    audiotest \
	evtest

# PowerVR libs
PRODUCT_COPY_FILES += \
	device/samsung/smdkv210/proprietary/vendor/bin/pvrsrvinit:system/vendor/bin/pvrsrvinit \
	device/samsung/smdkv210/proprietary/vendor/lib/libpvrANDROID_WSEGL.so:system/vendor/lib/libpvrANDROID_WSEGL.so \
	device/samsung/smdkv210/proprietary/vendor/lib/libPVRScopeServices.so:system/vendor/lib/libPVRScopeServices.so \
	device/samsung/smdkv210/proprietary/vendor/lib/libpvr2d.so:system/vendor/lib/libpvr2d.so \
	device/samsung/smdkv210/proprietary/vendor/lib/libsrv_init.so:system/vendor/lib/libsrv_init.so \
	device/samsung/smdkv210/proprietary/vendor/lib/libglslcompiler.so:system/vendor/lib/libglslcompiler.so \
	device/samsung/smdkv210/proprietary/vendor/lib/libusc.so:system/vendor/lib/libusc.so \
	device/samsung/smdkv210/proprietary/vendor/lib/libsrv_um.so:system/vendor/lib/libsrv_um.so \
	device/samsung/smdkv210/proprietary/vendor/lib/libIMGegl.so:system/vendor/lib/libIMGegl.so \
	device/samsung/smdkv210/proprietary/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so:system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
	device/samsung/smdkv210/proprietary/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
	device/samsung/smdkv210/proprietary/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
	device/samsung/smdkv210/proprietary/vendor/lib/hw/gralloc.smdkv210.so:system/vendor/lib/hw/gralloc.smdkv210.so

# Audio
PRODUCT_PACKAGES += \
	audio.primary.smdkv210 \
	audio_policy.smdkv210 \
	audio.a2dp.default \
	libaudioutils

# Camera
PRODUCT_PACKAGES += \
    libs3cjpeg \
	camera.smdkv210

# Libs
PRODUCT_PACKAGES += \
	libstagefrighthw \
	com.android.future.usb.accessory

# Misc other modules
PRODUCT_PACKAGES += \
	sensors.smdkv210 \
	lights.s5pc110 \
    hwcomposer.s5pc110

# Preinstalled utility app(s).
PRODUCT_PACKAGES += \
    ESFileManager \
    Superuser

# Bundle of GoogleApps.
PRODUCT_PACKAGES += \
    CameraGoogle SetupWizard GoogleLoginService Gmail \
    Vending GooglePartnerSetup ChromeBookmarksSyncAdapter \
    DeskClockGoogle GoogleBackupTransport GoogleFeedback \
    GoogleQuickSearchBox OneTimeInitializer GenieWidget \
    BrowserGoogle GoogleServicesFramework Talk EmailGoogle \
    ExchangeGoogle CalendarGoogle GoogleTTS GoogleContactsSyncAdapter \
    NetworkLocation MediaUploader MarketUpdater GalleryGoogle \
    LatinImeGoogle VideoEditorGoogle VoiceSearch

# GoogleApps dependencies.
PRODUCT_COPY_FILES += \
    device/samsung/smdkv210/google/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    device/samsung/smdkv210/google/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    device/samsung/smdkv210/google/etc/permissions/features.xml:system/etc/permissions/features.xml \
    device/samsung/smdkv210/google/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    device/samsung/smdkv210/google/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar \
    device/samsung/smdkv210/google/lib/libvideochat_stabilize.so:system/lib/libvideochat_stabilize.so \
    device/samsung/smdkv210/google/lib/libvideochat_jni.so:system/lib/libvideochat_jni.so \
    device/samsung/smdkv210/google/lib/libfrsdk.so:system/lib/libfrsdk.so \
    device/samsung/smdkv210/google/lib/libvoicesearch.so:system/lib/libvoicesearch.so \
    device/samsung/smdkv210/google/lib/libspeexwrapper.so:system/lib/libspeexwrapper.so

# Dalvik heap limits.
include frameworks/base/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage


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

PRODUCT_CHARACTERISTICS := tablet

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

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0

# Generated kcm keymaps
PRODUCT_PACKAGES += \
 	s3c-button.kcm \
 	ft5x0x_ts.kcm \
	S5P_TouchScreen.kcm

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/smdkv210/init.smdkv210.rc:root/init.smdkv210.rc \
	device/samsung/smdkv210/init.smdkv210.usb.rc:root/init.smdkv210.usb.rc \
	device/samsung/smdkv210/fstab.smdkv210:root/fstab.smdkv210 \
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
WIFI_BAND := 802_11_BG

PRODUCT_COPY_FILES += \
	device/samsung/smdkv210/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	device/samsung/smdkv210/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/samsung/smdkv210/hostapd.conf:system/etc/wifi/hostapd.conf \
	device/samsung/smdkv210/ar6000.ko:system/lib/modules/ar6000.ko \
	device/samsung/smdkv210/proprietary/wifi/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
	device/samsung/smdkv210/proprietary/wifi/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
	device/samsung/smdkv210/proprietary/wifi/fakeBoardData_AR6002.bin:system/wifi/fakeBoardData_AR6002.bin

# MFC Firmware
PRODUCT_COPY_FILES += \
        device/samsung/smdkv210/samsung_mfc_fw.bin:system/vendor/firmware/samsung_mfc_fw.bin

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/samsung/smdkv210/secomxregistry:system/etc/secomxregistry \
	device/samsung/smdkv210/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/smdkv210/media_codecs.xml:system/etc/media_codecs.xml

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
	evtest \
    lcd_info

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
	device/samsung/smdkv210/proprietary/vendor/lib/hw/gralloc.s5pc110.so:system/vendor/lib/hw/gralloc.s5pc110.so

# Audio
PRODUCT_PACKAGES += \
	audio.primary.smdkv210 \
	audio_policy.smdkv210 \
	audio.a2dp.default \
	audio.usb.default

PRODUCT_COPY_FILES += \
	device/samsung/smdkv210/libaudio/audio_policy.conf:system/etc/audio_policy.conf

# Camera
PRODUCT_PACKAGES += \
    libs3cjepg \
	camera.smdkv210

# GPS config
PRODUCT_COPY_FILES += \
    device/samsung/smdkv210/gps.xml:system/vendor/etc/gps.xml \
    device/samsung/smdkv210/gps.conf:system/etc/gps.conf

# Libs
PRODUCT_PACKAGES += \
	libcamera \
	libstagefrighthw \
	com.android.future.usb.accessory

# Misc other modules
PRODUCT_PACKAGES += \
	lights.s5pc110 \
	hwcomposer.s5pc110 \
	sensors.smdkv210 

# Preinstalled utility app(s).
PRODUCT_PACKAGES += \
    ESFileExplorer \
    Superuser

# Bundle of GoogleApps.
PRODUCT_PACKAGES += \
    ChromeBookmarksSyncAdapter FaceLock GenieWidget Gmail GmsCore \
    GoogleBackupTransport GoogleCalendarSyncAdapter GoogleContactsSyncAdapter \
    GoogleEars GoogleFeedback GoogleLoginService GooglePartnerSetup \
    GoogleServicesFramework GoogleTTS LatinImeDictionaryPack \
    MediaUploader NetworkLocation OneTimeInitializer Phonesky \
    SetupWizard Talk Talkback Vending VoiceSearchStub

# GoogleApps dependencies.
PRODUCT_COPY_FILES += \
    device/samsung/smdkv210/google/etc/permissions/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
    device/samsung/smdkv210/google/etc/permissions/com.google.android.media.effects.xml:system/etc/permissions/com.google.android.media.effects.xml \
    device/samsung/smdkv210/google/etc/permissions/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
    device/samsung/smdkv210/google/etc/permissions/features.xml:system/etc/permissions/features.xml \
    device/samsung/smdkv210/google/framework/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
    device/samsung/smdkv210/google/framework/com.google.android.media.effects.jar:system/framework/com.google.android.media.effects.jar \
    device/samsung/smdkv210/google/framework/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar \
    device/samsung/smdkv210/google/lib/libfacelock_jni.so:system/lib/libfacelock_jni.so \
    device/samsung/smdkv210/google/lib/libfilterpack_facedetect.so:system/lib/libfilterpack_facedetect.so \
    device/samsung/smdkv210/google/lib/libflint_engine_jni_api.so:system/lib/libflint_engine_jni_api.so \
    device/samsung/smdkv210/google/lib/libfrsdk.so:system/lib/libfrsdk.so \
    device/samsung/smdkv210/google/lib/libgcomm_jni.so:system/lib/libgcomm_jni.so \
    device/samsung/smdkv210/google/lib/libgoogle_recognizer_jni.so:system/lib/libgoogle_recognizer_jni.so \
    device/samsung/smdkv210/google/lib/libpatts_engine_jni_api.so:system/lib/libpatts_engine_jni_api.so \
    device/samsung/smdkv210/google/lib/libpicowrapper.so:system/lib/libpicowrapper.so \
    device/samsung/smdkv210/google/lib/libspeexwrapper.so:system/lib/libspeexwrapper.so \
    device/samsung/smdkv210/google/lib/libvideochat_jni.so:system/lib/libvideochat_jni.so \
    device/samsung/smdkv210/google/lib/libvideochat_stabilize.so:system/lib/libvideochat_stabilize.so \
    device/samsung/smdkv210/google/lib/libvoicesearch.so:system/lib/libvoicesearch.so \
    device/samsung/smdkv210/google/lib/libvorbisencoder.so:system/lib/libvorbisencoder.so \
    device/samsung/smdkv210/google/tts/lang_pico/de-DE_gl0_sg.bin:system/tts/lang_pico/de-DE_gl0_sg.bin \
    device/samsung/smdkv210/google/tts/lang_pico/de-DE_ta.bin:system/tts/lang_pico/de-DE_ta.bin \
    device/samsung/smdkv210/google/tts/lang_pico/es-ES_ta.bin:system/tts/lang_pico/es-ES_ta.bin \
    device/samsung/smdkv210/google/tts/lang_pico/es-ES_zl0_sg.bin:system/tts/lang_pico/es-ES_zl0_sg.bin \
    device/samsung/smdkv210/google/tts/lang_pico/fr-FR_nk0_sg.bin:system/tts/lang_pico/fr-FR_nk0_sg.bin \
    device/samsung/smdkv210/google/tts/lang_pico/fr-FR_ta.bin:system/tts/lang_pico/fr-FR_ta.bin \
    device/samsung/smdkv210/google/tts/lang_pico/it-IT_cm0_sg.bin:system/tts/lang_pico/it-IT_cm0_sg.bin \
    device/samsung/smdkv210/google/tts/lang_pico/it-IT_ta.bin:system/tts/lang_pico/it-IT_ta.bin \
    device/samsung/smdkv210/google/usr/srec/en-US/acoustic_model:system/usr/srec/en-US/acoustic_model \
    device/samsung/smdkv210/google/usr/srec/en-US/c_fst:system/usr/srec/en-US/c_fst \
    device/samsung/smdkv210/google/usr/srec/en-US/clg:system/usr/srec/en-US/clg \
    device/samsung/smdkv210/google/usr/srec/en-US/compile_grammar.config:system/usr/srec/en-US/compile_grammar.config \
    device/samsung/smdkv210/google/usr/srec/en-US/contacts.abnf:system/usr/srec/en-US/contacts.abnf \
    device/samsung/smdkv210/google/usr/srec/en-US/dict:system/usr/srec/en-US/dict \
    device/samsung/smdkv210/google/usr/srec/en-US/dictation.config:system/usr/srec/en-US/dictation.config \
    device/samsung/smdkv210/google/usr/srec/en-US/embed_phone_nn_model:system/usr/srec/en-US/embed_phone_nn_model \
    device/samsung/smdkv210/google/usr/srec/en-US/embed_phone_nn_state_sym:system/usr/srec/en-US/embed_phone_nn_state_sym \
    device/samsung/smdkv210/google/usr/srec/en-US/endpointer_dictation.config:system/usr/srec/en-US/endpointer_dictation.config \
    device/samsung/smdkv210/google/usr/srec/en-US/endpointer_voicesearch.config:system/usr/srec/en-US/endpointer_voicesearch.config \
    device/samsung/smdkv210/google/usr/srec/en-US/ep_acoustic_model:system/usr/srec/en-US/ep_acoustic_model \
    device/samsung/smdkv210/google/usr/srec/en-US/g2p_fst:system/usr/srec/en-US/g2p_fst \
    device/samsung/smdkv210/google/usr/srec/en-US/google_hotword_clg:system/usr/srec/en-US/google_hotword_clg \
    device/samsung/smdkv210/google/usr/srec/en-US/google_hotword.config:system/usr/srec/en-US/google_hotword.config \
    device/samsung/smdkv210/google/usr/srec/en-US/google_hotword_logistic:system/usr/srec/en-US/google_hotword_logistic \
    device/samsung/smdkv210/google/usr/srec/en-US/grammar.config:system/usr/srec/en-US/grammar.config \
    device/samsung/smdkv210/google/usr/srec/en-US/hmmsyms:system/usr/srec/en-US/hmmsyms \
    device/samsung/smdkv210/google/usr/srec/en-US/hotword_symbols:system/usr/srec/en-US/hotword_symbols \
    device/samsung/smdkv210/google/usr/srec/en-US/lintrans_model:system/usr/srec/en-US/lintrans_model \
    device/samsung/smdkv210/google/usr/srec/en-US/metadata:system/usr/srec/en-US/metadata \
    device/samsung/smdkv210/google/usr/srec/en-US/normalizer:system/usr/srec/en-US/normalizer \
    device/samsung/smdkv210/google/usr/srec/en-US/norm_fst:system/usr/srec/en-US/norm_fst \
    device/samsung/smdkv210/google/usr/srec/en-US/offensive_word_normalizer:system/usr/srec/en-US/offensive_word_normalizer \
    device/samsung/smdkv210/google/usr/srec/en-US/phonelist:system/usr/srec/en-US/phonelist \
    device/samsung/smdkv210/google/usr/srec/en-US/rescoring_lm:system/usr/srec/en-US/rescoring_lm \
    device/samsung/smdkv210/google/usr/srec/en-US/symbols:system/usr/srec/en-US/symbols \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/left_eye-y0-yi45-p0-pi45-r0-ri20.2d_n2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/left_eye-y0-yi45-p0-pi45-r0-ri20.2d_n2/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/left_eye-y0-yi45-p0-pi45-rn7-ri20.2d_n2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/left_eye-y0-yi45-p0-pi45-rn7-ri20.2d_n2/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/left_eye-y0-yi45-p0-pi45-rp7-ri20.2d_n2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/left_eye-y0-yi45-p0-pi45-rp7-ri20.2d_n2/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/nose_base-y0-yi45-p0-pi45-r0-ri20.2d_n2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/nose_base-y0-yi45-p0-pi45-r0-ri20.2d_n2/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/nose_base-y0-yi45-p0-pi45-rn7-ri20.2d_n2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/nose_base-y0-yi45-p0-pi45-rn7-ri20.2d_n2/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/nose_base-y0-yi45-p0-pi45-rp7-ri20.2d_n2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/nose_base-y0-yi45-p0-pi45-rp7-ri20.2d_n2/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/right_eye-y0-yi45-p0-pi45-r0-ri20.2d_n2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/right_eye-y0-yi45-p0-pi45-r0-ri20.2d_n2/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/right_eye-y0-yi45-p0-pi45-rn7-ri20.2d_n2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/right_eye-y0-yi45-p0-pi45-rn7-ri20.2d_n2/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/right_eye-y0-yi45-p0-pi45-rp7-ri20.2d_n2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.3/right_eye-y0-yi45-p0-pi45-rp7-ri20.2d_n2/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/left_eye-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/nose_base-y0-yi45-p0-pi45-r0-ri20.lg_32/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-2/full_model.bin:system/vendor/pittpatt/models/detection/multi_pose_face_landmark_detectors.7/right_eye-y0-yi45-p0-pi45-r0-ri20.lg_32-2/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/yaw_roll_face_detectors.3/head-y0-yi45-p0-pi45-r0-ri30.4a/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.3/head-y0-yi45-p0-pi45-r0-ri30.4a/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/yaw_roll_face_detectors.3/head-y0-yi45-p0-pi45-rn30-ri30.5/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.3/head-y0-yi45-p0-pi45-rn30-ri30.5/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/yaw_roll_face_detectors.3/head-y0-yi45-p0-pi45-rp30-ri30.5/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.3/head-y0-yi45-p0-pi45-rp30-ri30.5/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-r0-ri30.4a-v24/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-r0-ri30.4a-v24/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rn30-ri30.5-v24/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rn30-ri30.5-v24/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rp30-ri30.5-v24/full_model.bin:system/vendor/pittpatt/models/detection/yaw_roll_face_detectors.6/head-y0-yi45-p0-pi45-rp30-ri30.5-v24/full_model.bin \
    device/samsung/smdkv210/google/vendor/pittpatt/models/recognition/face.face.y0-y0-22-b-N/full_model.bin:system/vendor/pittpatt/models/recognition/face.face.y0-y0-22-b-N/full_model.bin

# Dalvik heap limits.
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage


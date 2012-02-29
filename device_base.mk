#
# Copyright (C) 2011 The Android Open-Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/asus/tf101/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := device/asus/tf101/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
#PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xlarge sw600dp sw720dp
#PRODUCT_AAPT_PREF_CONFIG := xlarge
#PRODUCT_AAPT_PREF_CONFIG :=

PRODUCT_COPY_FILES := \
    $(LOCAL_KERNEL):kernel \
    device/asus/tf101/lib/egl/libEGL_perfhud.so:system/lib/egl/libEGL_perfhud.so \
    device/asus/tf101/lib/egl/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \
    device/asus/tf101/lib/egl/libGLESv1_CM_perfhud.so:system/lib/egl/libGLESv1_CM_perfhud.so \
    device/asus/tf101/lib/egl/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \
    device/asus/tf101/lib/egl/libGLESv2_perfhud.so:system/lib/egl/libGLESv2_perfhud.so \
    device/asus/tf101/lib/egl/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so \
    device/asus/tf101/lib/hw/audio_policy.tegra.so:system/lib/hw/audio_policy.tegra.so \
    device/asus/tf101/lib/hw/audio.primary.tegra.so:system/lib/hw/audio.primary.tegra.so \
    device/asus/tf101/lib/hw/camera.tegra.so:system/lib/hw/camera.tegra.so \
    device/asus/tf101/lib/hw/gps.ventana.so:system/lib/hw/gps.ventana.so \
    device/asus/tf101/lib/hw/gralloc.tegra.so:system/lib/hw/gralloc.tegra.so \
    device/asus/tf101/lib/hw/hwcomposer.tegra.so:system/lib/hw/hwcomposer.tegra.so \
    device/asus/tf101/lib/hw/lights.ventana.so:system/lib/hw/lights.ventana.so \
    device/asus/tf101/lib/hw/sensors.ventana.so:system/lib/hw/sensors.ventana.so \
    device/asus/tf101/lib/libardrv_dynamic.so:system/lib/libardrv_dynamic.so \
    device/asus/tf101/lib/libasound.so:system/lib/libasound.so \
    device/asus/tf101/lib/libcgdrv.so:system/lib/libcgdrv.so \
    device/asus/tf101/lib/libmllite.so:system/lib/libmllite.so \
    device/asus/tf101/lib/libmpl.so:system/lib/libmpl.so \
    device/asus/tf101/lib/libmlplatform.so:system/lib/libmlplatform.so \
    device/asus/tf101/lib/libnvasfparserhal.so:system/lib/libnvasfparserhal.so \
    device/asus/tf101/lib/libnvaviparserhal.so:system/lib/libnvaviparserhal.so \
    device/asus/tf101/lib/libnvavp.so:system/lib/libnvavp.so \
    device/asus/tf101/lib/libnvcpud_client.so:system/lib/libnvcpud_client.so \
    device/asus/tf101/lib/libnvcpud.so:system/lib/libnvcpud.so \
    device/asus/tf101/lib/libnvddk_2d.so:system/lib/libnvddk_2d.so \
    device/asus/tf101/lib/libnvddk_2d_v2.so:system/lib/libnvddk_2d_v2.so \
    device/asus/tf101/lib/libnvdispmgr_d.so:system/lib/libnvdispmgr_d.so \
    device/asus/tf101/lib/libnvhdmi3dplay_jni.so:system/lib/libnvhdmi3dplay_jni.so \
    device/asus/tf101/lib/libnvmm_asfparser.so:system/lib/libnvmm_asfparser.so \
    device/asus/tf101/lib/libnvmm_audio.so:system/lib/libnvmm_audio.so \
    device/asus/tf101/lib/libnvmm_aviparser.so:system/lib/libnvmm_aviparser.so \
    device/asus/tf101/lib/libnvmm_camera.so:system/lib/libnvmm_camera.so \
    device/asus/tf101/lib/libnvmm_contentpipe.so:system/lib/libnvmm_contentpipe.so \
    device/asus/tf101/lib/libnvmm_image.so:system/lib/libnvmm_image.so \
    device/asus/tf101/lib/libnvmmlite_audio.so:system/lib/libnvmmlite_audio.so \
    device/asus/tf101/lib/libnvmmlite.so:system/lib/libnvmmlite.so \
    device/asus/tf101/lib/libnvmmlite_utils.so:system/lib/libnvmmlite_utils.so \
    device/asus/tf101/lib/libnvmmlite_video.so:system/lib/libnvmmlite_video.so \
    device/asus/tf101/lib/libnvmm_manager.so:system/lib/libnvmm_manager.so \
    device/asus/tf101/lib/libnvmm_misc.so:system/lib/libnvmm_misc.so \
    device/asus/tf101/lib/libnvmm_msaudio.so:system/lib/libnvmm_msaudio.so \
    device/asus/tf101/lib/libnvmm_parser.so:system/lib/libnvmm_parser.so \
    device/asus/tf101/lib/libnvmm_service.so:system/lib/libnvmm_service.so \
    device/asus/tf101/lib/libnvmm.so:system/lib/libnvmm.so \
    device/asus/tf101/lib/libnvmm_utils.so:system/lib/libnvmm_utils.so \
    device/asus/tf101/lib/libnvmm_vc1_video.so:system/lib/libnvmm_vc1_video.so \
    device/asus/tf101/lib/libnvmm_video.so:system/lib/libnvmm_video.so \
    device/asus/tf101/lib/libnvmm_vp6_video.so:system/lib/libnvmm_vp6_video.so \
    device/asus/tf101/lib/libnvmm_writer.so:system/lib/libnvmm_writer.so \
    device/asus/tf101/lib/libnvodm_dtvtuner.so:system/lib/libnvodm_dtvtuner.so \
    device/asus/tf101/lib/libnvodm_hdmi.so:system/lib/libnvodm_hdmi.so \
    device/asus/tf101/lib/libnvodm_imager.so:system/lib/libnvodm_imager.so \
    device/asus/tf101/lib/libnvodm_misc.so:system/lib/libnvodm_misc.so \
    device/asus/tf101/lib/libnvodm_query.so:system/lib/libnvodm_query.so \
    device/asus/tf101/lib/libnvomxadaptor.so:system/lib/libnvomxadaptor.so \
    device/asus/tf101/lib/libnvomxilclient.so:system/lib/libnvomxilclient.so \
    device/asus/tf101/lib/libnvomx.so:system/lib/libnvomx.so \
    device/asus/tf101/lib/libnvos.so:system/lib/libnvos.so \
    device/asus/tf101/lib/libnvparser.so:system/lib/libnvparser.so \
    device/asus/tf101/lib/libnvrm_graphics.so:system/lib/libnvrm_graphics.so \
    device/asus/tf101/lib/libnvrm.so:system/lib/libnvrm.so \
    device/asus/tf101/lib/libnvsm.so:system/lib/libnvsm.so \
    device/asus/tf101/lib/libnvsystemuiext_jni.so:system/lib/libnvsystemuiext_jni.so \
    device/asus/tf101/lib/libnvtestio.so:system/lib/libnvtestio.so \
    device/asus/tf101/lib/libnvtestresults.so:system/lib/libnvtestresults.so \
    device/asus/tf101/lib/libnvtvmr.so:system/lib/libnvtvmr.so \
    device/asus/tf101/lib/libnvwinsys.so:system/lib/libnvwinsys.so \
    device/asus/tf101/lib/libnvwsi.so:system/lib/libnvwsi.so \
    device/asus/tf101/lib/libstagefrighthw.so:system/lib/libstagefrighthw.so \
    device/asus/tf101/lib/libsensors.al3000a.so:system/lib/libsensors.al3000a.so \
    device/asus/tf101/lib/libsensors.isl29018.so:system/lib/libsensors.isl29018.so \
    device/asus/tf101/lib/libsensors.base.so:system/lib/libsensors.base.so \
    device/asus/tf101/lib/libsensors.mpl.so:system/lib/libsensors.mpl.so

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    device/asus/tf101/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/asus/tf101/etc/bluetooth/bdaddr:system/etc/bluetooth/bdaddr

# Modules
PRODUCT_COPY_FILES += \
    device/asus/tf101/modules/battery_rvsd.ko:system/lib/modules/battery_rvsd.ko \
    device/asus/tf101/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/asus/tf101/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/asus/tf101/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko    

# Misc
PRODUCT_COPY_FILES += \
    device/asus/tf101/ramdisk/init:root/init \
    device/asus/tf101/ramdisk/init.ventana.rc:root/init.ventana.rc \
    device/asus/tf101/ramdisk/init.tf101.usb.rc:root/init.tf101.usb.rc \
    device/asus/tf101/ramdisk/sbin/texfat.ko:root/sbin/texfat.ko \
    device/asus/tf101/ramdisk/sbin/tntfs.ko:root/sbin/tntfs.ko \
    device/asus/tf101/ramdisk/ueventd.ventana.rc:root/ueventd.ventana.rc \
    device/asus/tf101/bin/sensors-config:system/bin/sensors-config \
    device/asus/tf101/bin/glgps:system/bin/glgps \
    device/asus/tf101/bin/wifimacwriter:system/bin/wifimacwriter \
    device/asus/tf101/data/srs_processing.cfg:system/data/srs_processing.cfg \
    device/asus/tf101/etc/asound.conf:system/etc/asound.conf \
    device/asus/tf101/etc/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    device/asus/tf101/vold.fstab:system/etc/vold.fstab \
    device/asus/tf101/wifi/bcm4329.cal:system/etc/wifi/bcm4329.cal

# Input stuff
PRODUCT_COPY_FILES += \
    device/asus/tf101/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    device/asus/tf101/usr/idc/elantech_touchscreen.idc:system/usr/idc/elantech_touchscreen.idc \
    device/asus/tf101/usr/idc/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
    device/asus/tf101/usr/keychars/asusec.kcm:system/usr/keychars/asusec.kcm \
    device/asus/tf101/usr/keylayout/asusec.kl:system/usr/keylayout/asusec.kl \
    device/asus/tf101/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Vendor firmware
PRODUCT_COPY_FILES += \
    device/asus/tf101/etc/firmware/nvmm_aacdec.axf:system/etc/firmware/nvmm_aacdec.axf \
    device/asus/tf101/etc/firmware/nvmm_adtsdec.axf:system/etc/firmware/nvmm_adtsdec.axf \
    device/asus/tf101/etc/firmware/nvmm_h264dec.axf:system/etc/firmware/nvmm_h264dec.axf \
    device/asus/tf101/etc/firmware/nvmm_jpegdec.axf:system/etc/firmware/nvmm_jpegdec.axf \
    device/asus/tf101/etc/firmware/nvmm_jpegenc.axf:system/etc/firmware/nvmm_jpegenc.axf \
    device/asus/tf101/etc/firmware/nvmm_manager.axf:system/etc/firmware/nvmm_manager.axf \
    device/asus/tf101/etc/firmware/nvmm_mp3dec.axf:system/etc/firmware/nvmm_mp3dec.axf \
    device/asus/tf101/etc/firmware/nvmm_mpeg4dec.axf:system/etc/firmware/nvmm_mpeg4dec.axf \
    device/asus/tf101/etc/firmware/nvmm_reference.axf:system/etc/firmware/nvmm_reference.axf \
    device/asus/tf101/etc/firmware/nvmm_service.axf:system/etc/firmware/nvmm_service.axf \
    device/asus/tf101/etc/firmware/nvmm_sorensondec.axf:system/etc/firmware/nvmm_sorensondec.axf \
    device/asus/tf101/etc/firmware/nvmm_vc1dec.axf:system/etc/firmware/nvmm_vc1dec.axf \
    device/asus/tf101/etc/firmware/nvmm_wavdec.axf:system/etc/firmware/nvmm_wavdec.axf \
    device/asus/tf101/etc/firmware/nvmm_wmadec.axf:system/etc/firmware/nvmm_wmadec.axf \
    device/asus/tf101/etc/firmware/nvmm_wmaprodec.axf:system/etc/firmware/nvmm_wmaprodec.axf \
    device/asus/tf101/etc/firmware/nvrm_avp.bin:system/etc/firmware/nvrm_avp.bin

# ALSA Config files
PRODUCT_COPY_FILES += \
    device/asus/tf101/usr/share/alsa/alsa.conf:system/usr/share/alsa/alsa.conf \
    device/asus/tf101/usr/share/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    device/asus/tf101/usr/share/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    device/asus/tf101/usr/share/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    device/asus/tf101/usr/share/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    device/asus/tf101/usr/share/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    device/asus/tf101/usr/share/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    device/asus/tf101/usr/share/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    device/asus/tf101/usr/share/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    device/asus/tf101/usr/share/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    device/asus/tf101/usr/share/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    device/asus/tf101/usr/share/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    device/asus/tf101/usr/share/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    device/asus/tf101/usr/share/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    device/asus/tf101/usr/share/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    device/asus/tf101/usr/share/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    device/asus/tf101/usr/share/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf

# Extra (for convenience)
PRODUCT_COPY_FILES += \
    device/asus/tf101/xbin/remount:system/xbin/remount

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0
#    wifi.supplicant_scan_interval=15

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

include frameworks/base/build/tablet-dalvik-heap.mk

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    device/asus/tf101/etc/permissions/com.asus.hardware.00.xml:system/etc/permissions/com.asus.hardware.00.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PACKAGES := \
    audio.a2dp.default \
    librs_jni \
    make_ext4fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory \
    whisperd \
    blobpack_tf

PRODUCT_CHARACTERISTICS := tablet

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media config xml file
PRODUCT_COPY_FILES += \
    device/asus/tf101/etc/media_profiles.xml:system/etc/media_profiles.xml

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \

$(call inherit-product-if-exists, vendor/asus/tf101/device-vendor.mk)

#WIFI_BAND             := 802_11_ABGN
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

ifneq ($(EOS_RELEASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=teameos \
    ro.modversion=Eos-$(EOS_RELEASE)-TF101
endif

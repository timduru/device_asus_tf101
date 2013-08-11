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
    LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Prebuilt Kernel Image + Modules

PRODUCT_COPY_FILES := \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES := \
    device/asus/tf101/prebuilt/lib/egl/libEGL_perfhud.so:system/lib/egl/libEGL_perfhud.so \
    device/asus/tf101/prebuilt/lib/egl/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \
    device/asus/tf101/prebuilt/lib/egl/libGLESv1_CM_perfhud.so:system/lib/egl/libGLESv1_CM_perfhud.so \
    device/asus/tf101/prebuilt/lib/egl/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \
    device/asus/tf101/prebuilt/lib/egl/libGLESv2_perfhud.so:system/lib/egl/libGLESv2_perfhud.so \
    device/asus/tf101/prebuilt/lib/egl/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so \
    device/asus/tf101/prebuilt/lib/hw/camera.tegra.so:system/lib/hw/camera.tegra.so \
    device/asus/tf101/prebuilt/lib/hw/gps.ventana.so:system/lib/hw/gps.ventana.so \
    device/asus/tf101/prebuilt/lib/hw/gralloc.tegra.so:system/lib/hw/gralloc.tegra.so \
    device/asus/tf101/prebuilt/lib/hw/hwcomposer.tegra.so:system/lib/hw/hwcomposer.tegra.so \
    device/asus/tf101/prebuilt/lib/hw/lights.ventana.so:system/lib/hw/lights.ventana.so \
    device/asus/tf101/prebuilt/lib/hw/sensors.ventana.so:system/lib/hw/sensors.ventana.so \
    device/asus/tf101/prebuilt/lib/libardrv_dynamic.so:system/lib/libardrv_dynamic.so \
    device/asus/tf101/prebuilt/lib/libasound.so:system/lib/libasound.so \
    device/asus/tf101/prebuilt/lib/libcgdrv.so:system/lib/libcgdrv.so \
    device/asus/tf101/prebuilt/lib/libmllite.so:system/lib/libmllite.so \
    device/asus/tf101/prebuilt/lib/libmpl.so:system/lib/libmpl.so \
    device/asus/tf101/prebuilt/lib/libmlplatform.so:system/lib/libmlplatform.so \
    device/asus/tf101/prebuilt/lib/libnvasfparserhal.so:system/lib/libnvasfparserhal.so \
    device/asus/tf101/prebuilt/lib/libnvaviparserhal.so:system/lib/libnvaviparserhal.so \
    device/asus/tf101/prebuilt/lib/libnvavp.so:system/lib/libnvavp.so \
    device/asus/tf101/prebuilt/lib/libnvcpud_client.so:system/lib/libnvcpud_client.so \
    device/asus/tf101/prebuilt/lib/libnvcpud.so:system/lib/libnvcpud.so \
    device/asus/tf101/prebuilt/lib/libnvddk_2d.so:system/lib/libnvddk_2d.so \
    device/asus/tf101/prebuilt/lib/libnvddk_2d_v2.so:system/lib/libnvddk_2d_v2.so \
    device/asus/tf101/prebuilt/lib/libnvdispmgr_d.so:system/lib/libnvdispmgr_d.so \
    device/asus/tf101/prebuilt/lib/libnvhdmi3dplay_jni.so:system/lib/libnvhdmi3dplay_jni.so \
    device/asus/tf101/prebuilt/lib/libnvmm_asfparser.so:system/lib/libnvmm_asfparser.so \
    device/asus/tf101/prebuilt/lib/libnvmm_audio.so:system/lib/libnvmm_audio.so \
    device/asus/tf101/prebuilt/lib/libnvmm_aviparser.so:system/lib/libnvmm_aviparser.so \
    device/asus/tf101/prebuilt/lib/libnvmm_camera.so:system/lib/libnvmm_camera.so \
    device/asus/tf101/prebuilt/lib/libnvmm_contentpipe.so:system/lib/libnvmm_contentpipe.so \
    device/asus/tf101/prebuilt/lib/libnvmm_image.so:system/lib/libnvmm_image.so \
    device/asus/tf101/prebuilt/lib/libnvmmlite_audio.so:system/lib/libnvmmlite_audio.so \
    device/asus/tf101/prebuilt/lib/libnvmmlite.so:system/lib/libnvmmlite.so \
    device/asus/tf101/prebuilt/lib/libnvmmlite_utils.so:system/lib/libnvmmlite_utils.so \
    device/asus/tf101/prebuilt/lib/libnvmmlite_video.so:system/lib/libnvmmlite_video.so \
    device/asus/tf101/prebuilt/lib/libnvmm_manager.so:system/lib/libnvmm_manager.so \
    device/asus/tf101/prebuilt/lib/libnvmm_misc.so:system/lib/libnvmm_misc.so \
    device/asus/tf101/prebuilt/lib/libnvmm_msaudio.so:system/lib/libnvmm_msaudio.so \
    device/asus/tf101/prebuilt/lib/libnvmm_parser.so:system/lib/libnvmm_parser.so \
    device/asus/tf101/prebuilt/lib/libnvmm_service.so:system/lib/libnvmm_service.so \
    device/asus/tf101/prebuilt/lib/libnvmm.so:system/lib/libnvmm.so \
    device/asus/tf101/prebuilt/lib/libnvmm_utils.so:system/lib/libnvmm_utils.so \
    device/asus/tf101/prebuilt/lib/libnvmm_vc1_video.so:system/lib/libnvmm_vc1_video.so \
    device/asus/tf101/prebuilt/lib/libnvmm_video.so:system/lib/libnvmm_video.so \
    device/asus/tf101/prebuilt/lib/libnvmm_vp6_video.so:system/lib/libnvmm_vp6_video.so \
    device/asus/tf101/prebuilt/lib/libnvmm_writer.so:system/lib/libnvmm_writer.so \
    device/asus/tf101/prebuilt/lib/libnvodm_dtvtuner.so:system/lib/libnvodm_dtvtuner.so \
    device/asus/tf101/prebuilt/lib/libnvodm_hdmi.so:system/lib/libnvodm_hdmi.so \
    device/asus/tf101/prebuilt/lib/libnvodm_imager.so:system/lib/libnvodm_imager.so \
    device/asus/tf101/prebuilt/lib/libnvodm_misc.so:system/lib/libnvodm_misc.so \
    device/asus/tf101/prebuilt/lib/libnvodm_query.so:system/lib/libnvodm_query.so \
    device/asus/tf101/prebuilt/lib/libnvomxadaptor.so:system/lib/libnvomxadaptor.so \
    device/asus/tf101/prebuilt/lib/libnvomxilclient.so:system/lib/libnvomxilclient.so \
    device/asus/tf101/prebuilt/lib/libnvomx.so:system/lib/libnvomx.so \
    device/asus/tf101/prebuilt/lib/libnvos.so:system/lib/libnvos.so \
    device/asus/tf101/prebuilt/lib/libnvparser.so:system/lib/libnvparser.so \
    device/asus/tf101/prebuilt/lib/libnvrm_graphics.so:system/lib/libnvrm_graphics.so \
    device/asus/tf101/prebuilt/lib/libnvrm.so:system/lib/libnvrm.so \
    device/asus/tf101/prebuilt/lib/libnvsm.so:system/lib/libnvsm.so \
    device/asus/tf101/prebuilt/lib/libnvsystemuiext_jni.so:system/lib/libnvsystemuiext_jni.so \
    device/asus/tf101/prebuilt/lib/libnvtestio.so:system/lib/libnvtestio.so \
    device/asus/tf101/prebuilt/lib/libnvtestresults.so:system/lib/libnvtestresults.so \
    device/asus/tf101/prebuilt/lib/libnvtvmr.so:system/lib/libnvtvmr.so \
    device/asus/tf101/prebuilt/lib/libnvwinsys.so:system/lib/libnvwinsys.so \
    device/asus/tf101/prebuilt/lib/libnvwsi.so:system/lib/libnvwsi.so \
    device/asus/tf101/prebuilt/lib/libstagefrighthw.so:system/lib/libstagefrighthw.so \
    device/asus/tf101/prebuilt/lib/libsensors.al3000a.so:system/lib/libsensors.al3000a.so \
    device/asus/tf101/prebuilt/lib/libsensors.isl29018.so:system/lib/libsensors.isl29018.so \
    device/asus/tf101/prebuilt/lib/libsensors.base.so:system/lib/libsensors.base.so \
    device/asus/tf101/prebuilt/lib/libsensors.mpl.so:system/lib/libsensors.mpl.so

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    device/asus/tf101/prebuilt/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/asus/tf101/prebuilt/etc/bluetooth/bdaddr:system/etc/bluetooth/bdaddr \
    device/asus/tf101/prebuilt/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Ramdisk files
PRODUCT_COPY_FILES += \
    device/asus/tf101/fstab.ventana:root/fstab.ventana \
    device/asus/tf101/ramdisk/init.ventana.rc:root/init.ventana.rc \
    device/asus/tf101/ramdisk/init.ventana.keyboard.rc:root/init.ventana.keyboard.rc \
    device/asus/tf101/ramdisk/init.ventana.usb.rc:root/init.ventana.usb.rc \
    device/asus/tf101/ramdisk/ueventd.ventana.rc:root/ueventd.ventana.rc \
    device/asus/tf101/ramdisk/sbin/keyswap::root/sbin/keyswap \

# Misc
PRODUCT_COPY_FILES += \
    device/asus/tf101/prebuilt/bin/sensors-config:system/bin/sensors-config \
    device/asus/tf101/prebuilt/bin/glgps:system/bin/glgps \
    device/asus/tf101/prebuilt/bin/wifimacwriter:system/bin/wifimacwriter \
    device/asus/tf101/prebuilt/xbin/busybox:system/xbin/busybox \
    device/asus/tf101/prebuilt/data/srs_processing.cfg:system/data/srs_processing.cfg \
    device/asus/tf101/audio/asound.conf:system/etc/asound.conf \
    device/asus/tf101/prebuilt/etc/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    device/asus/tf101/prebuilt/wifi/nvram_murata.txt:system/etc/nvram_murata.txt \
    device/asus/tf101/prebuilt/wifi/nvram_nh615_sl101.txt:system/etc/nvram_nh615_sl101.txt \
    device/asus/tf101/prebuilt/wifi/nvram_nh615.txt:system/etc/nvram_nh615.txt \
    device/asus/tf101/prebuilt/wifi/nvram.txt:system/etc/nvram.txt

# Input stuff
PRODUCT_COPY_FILES += \
    device/asus/tf101/prebuilt/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    device/asus/tf101/prebuilt/usr/idc/elantech_touchscreen.idc:system/usr/idc/elantech_touchscreen.idc \
    device/asus/tf101/prebuilt/usr/idc/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
    device/asus/tf101/prebuilt/usr/keychars/asusec.kcm:system/usr/keychars/asusec.kcm \
    device/asus/tf101/prebuilt/usr/keylayout/asusec.kl:system/usr/keylayout/asusec.kl \
    device/asus/tf101/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Vendor firmware
PRODUCT_COPY_FILES += \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_aacdec.axf:system/etc/firmware/nvmm_aacdec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_adtsdec.axf:system/etc/firmware/nvmm_adtsdec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_h264dec.axf:system/etc/firmware/nvmm_h264dec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_jpegdec.axf:system/etc/firmware/nvmm_jpegdec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_jpegenc.axf:system/etc/firmware/nvmm_jpegenc.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_manager.axf:system/etc/firmware/nvmm_manager.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_mp3dec.axf:system/etc/firmware/nvmm_mp3dec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_mpeg4dec.axf:system/etc/firmware/nvmm_mpeg4dec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_reference.axf:system/etc/firmware/nvmm_reference.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_service.axf:system/etc/firmware/nvmm_service.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_sorensondec.axf:system/etc/firmware/nvmm_sorensondec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_vc1dec.axf:system/etc/firmware/nvmm_vc1dec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_wavdec.axf:system/etc/firmware/nvmm_wavdec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_wmadec.axf:system/etc/firmware/nvmm_wmadec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvmm_wmaprodec.axf:system/etc/firmware/nvmm_wmaprodec.axf \
    device/asus/tf101/prebuilt/etc/firmware/nvrm_avp.bin:system/etc/firmware/nvrm_avp.bin \
    device/asus/tf101/prebuilt/vendor/firmware/fw_bcmdhd.bin:system/vendor/firmware/fw_bcmdhd.bin \
    device/asus/tf101/prebuilt/vendor/firmware/fw_bcmdhd_apsta.bin:system/vendor/firmware/fw_bcmdhd_apsta.bin \
    device/asus/tf101/prebuilt/vendor/firmware/fw_bcmdhd_p2p.bin:system/vendor/firmware/fw_bcmdhd_p2p.bin

# ALSA Config files
PRODUCT_COPY_FILES += \
    device/asus/tf101/prebuilt/usr/share/alsa/alsa.conf:system/usr/share/alsa/alsa.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    device/asus/tf101/prebuilt/usr/share/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.sf.lcd_density=160

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

include frameworks/native/build/tablet-dalvik-heap.mk

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    device/asus/tf101/prebuilt/etc/permissions/android.hardware.tf101.xml:system/etc/permissions/android.hardware.tf101.xml \

PRODUCT_PACKAGES := \
    audio_policy.tegra \
    audio.primary.tegra \
    audio.a2dp.default \
    audio.usb.default \
    librs_jni \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory \
    whisperd \
    libaudioutils \
    libinvensense_mpl \
    blobpack_tf \
    AutoParts

PRODUCT_CHARACTERISTICS := tablet

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media config xml file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# media codec config xml file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml

# Camera config file
PRODUCT_COPY_FILES += \
    device/asus/tf101/prebuilt/etc/nvcamera.conf:system/etc/nvcamera.conf \

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \

# audio mixer paths
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

$(call inherit-product-if-exists, vendor/asus/tf101/device-vendor.mk)

ifneq ($(EOS_RELEASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=teameos \
    ro.modversion=Eos-$(EOS_RELEASE)-TF101
endif

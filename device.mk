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
    device/asus/tf101/init.ventana.rc:root/init.ventana.rc \
    device/asus/tf101/ueventd.ventana.rc:root/ueventd.ventana.rc \
    device/asus/tf101/glgps:system/bin/glgps \
    device/asus/tf101/etc/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    device/asus/tf101/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/tf101/egl/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \
    device/asus/tf101/egl/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \
    device/asus/tf101/egl/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so \
    device/asus/tf101/lib/libcgdrv.so:system/lib/libcgdrv.so \
    device/asus/tf101/lib/libnvddk_2d.so:system/lib/libnvddk_2d.so \
    device/asus/tf101/lib/libnvddk_2d_v2.so:system/lib/libnvddk_2d_v2.so \
    device/asus/tf101/lib/libnvdispatch_helper.so:system/lib/libnvdispatch_helper.so \
    device/asus/tf101/lib/libnvdispmgr_d.so:system/lib/libnvdispmgr_d.so \
    device/asus/tf101/lib/libnvos.so:system/lib/libnvos.so \
    device/asus/tf101/lib/libnvrm_channel.so:system/lib/libnvrm_channel.so \
    device/asus/tf101/lib/libnvrm_graphics.so:system/lib/libnvrm_graphics.so \
    device/asus/tf101/lib/libnvrm.so:system/lib/libnvrm.so \
    device/asus/tf101/lib/libnvwsi.so:system/lib/libnvwsi.so \
    device/asus/tf101/lib/libmpl.so:system/lib/libmpl.so \
    device/asus/tf101/lib/libmlplatform.so:system/lib/libmlplatform.so \
    device/asus/tf101/lib/libmllite.so:system/lib/libmllite.so \
    device/asus/tf101/lib/libsensors.mpl.so:system/lib/libsensors.mpl.so \
    device/asus/tf101/lib/hw/gps.ventana.so:system/lib/hw/gps.ventana.so \
    device/asus/tf101/lib/hw/gralloc.tegra.so:system/lib/hw/gralloc.tegra.so \
    device/asus/tf101/lib/hw/lights.ventana.so:system/lib/hw/lights.ventana.so \
    device/asus/tf101/lib/hw/overlay.tegra.so:system/lib/hw/overlay.tegra.so \
    device/asus/tf101/lib/hw/sensors.tegra.so:system/lib/hw/sensors.tegra.so \
    device/asus/tf101/lib/hw/sensors.ventana.so:system/lib/hw/sensors.ventana.so \
    device/asus/tf101/lib/hw/tegra_alsa.ventana.so:system/lib/hw/tegra_alsa.ventana.so \

#    device/asus/tf101/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so 
#    device/asus/tf101/lib/hw/hwcomposer.tegra.so:system/lib/hw/hwcomposer.tegra.so \

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    device/asus/tf101/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/asus/tf101/etc/bluetooth/bdaddr:system/etc/bluetooth/bdaddr

# Modules
PRODUCT_COPY_FILES += \
    device/asus/tf101/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/asus/tf101/modules/bcm4329.ko:system/lib/modules/bcm4329.ko
    device/asus/tf101/modules/battery_rvsd.ko:system/lib/modules/battery_rvsd.ko

# Misc
PRODUCT_COPY_FILES += \
    device/asus/tf101/vold.fstab:system/etc/vold.fstab \
    device/asus/tf101/wifi/bcm4329.cal:system/etc/wifi/bcm4329.cal

# Input stuff
PRODUCT_COPY_FILES += \
    device/asus/tf101/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    device/asus/tf101/usr/idc/eGalax_Serial.idc:system/usr/idc/eGalax_Serial.idc \
    device/asus/tf101/usr/idc/elantech_touchscreen.idc:system/usr/idc/elantech_touchscreen.idc \
    device/asus/tf101/usr/idc/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
    device/asus/tf101/usr/keychars/asusec.kcm:system/usr/keychars/asusec.kcm \
    device/asus/tf101/usr/keylayout/asusec.kl:system/usr/keylayout/asusec.kl \
    device/asus/tf101/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Vendor firmware
PRODUCT_COPY_FILES += \
    device/asus/tf101/etc/firmware/nvddk_audiofx_core.axf:system/etc/firmware/nvddk_audiofx_core.axf \
    device/asus/tf101/etc/firmware/nvddk_audiofx_transport.axf:system/etc/firmware/nvddk_audiofx_transport.axf \
    device/asus/tf101/etc/firmware/nvmm_aacdec.axf:system/etc/firmware/nvmm_aacdec.axf \
    device/asus/tf101/etc/firmware/nvmm_adtsdec.axf:system/etc/firmware/nvmm_adtsdec.axf \
    device/asus/tf101/etc/firmware/nvmm_audiomixer.axf:system/etc/firmware/nvmm_audiomixer.axf \
    device/asus/tf101/etc/firmware/nvmm_h264dec.axf:system/etc/firmware/nvmm_h264dec.axf \
    device/asus/tf101/etc/firmware/nvmm_jpegdec.axf:system/etc/firmware/nvmm_jpegdec.axf \
    device/asus/tf101/etc/firmware/nvmm_jpegenc.axf:system/etc/firmware/nvmm_jpegenc.axf \
    device/asus/tf101/etc/firmware/nvmm_manager.axf:system/etc/firmware/nvmm_manager.axf \
    device/asus/tf101/etc/firmware/nvmm_mp2dec.axf:system/etc/firmware/nvmm_mp2dec.axf \
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

# Extra (for convenience)
PRODUCT_COPY_FILES += \
    device/asus/tf101/xbin/remount:system/xbin/remount

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=adb

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    device/asus/tf101/etc/permissions/asus.hardware.TF101.xml:system/etc/permissions/asus.hardware.TF101.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

PRODUCT_CHARACTERISTICS := tablet,sdcard

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
	PRODUCT_PACKAGES += send_bug
	PRODUCT_COPY_FILES += \
		system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
		system/extras/bugmailer/send_bug:system/bin/send_bug
endif

$(call inherit-product-if-exists, vendor/asus/tf101/device-vendor.mk)

BOARD_WLAN_DEVICE_REV := bcm4329
WIFI_BAND             := 802_11_ABGN

$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)

# Copyright (C) 2011 The Android Open Source Project
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

#
# This file is the build configuration for a full Android
# build for tf101 hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Set the physical display size with PRODUCT_AAPT_CONFIG
# Options are small(~2"-3"), normal(~3"-4"), large(~4"-7"), xlarge(~7" and larger)
PRODUCT_AAPT_CONFIG := xlarge
# Set the preferred asset density with PRODUCT_AAPT_PREF_CONFIG
# See android CCD for valid options
PRODUCT_AAPT_PREF_CONFIG := mdpi
# A list of dpis to select prebuilt apk, in precedence order.
# See android CCD for valid options
PRODUCT_AAPT_PREBUILT_DPI := mdpi xhdpi hdpi tvdpi ldpi

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/asus/tf101/tf101-vendor.mk)

# A few more packages that aren't quite used on all builds
PRODUCT_PACKAGES := \
	HoloSpiralWallpaper \
	LiveWallpapersPicker \
	VisualizationWallpapers

# Camera
PRODUCT_PACKAGES += \
    Camera

# 
PRODUCT_PACKAGES += \
   libnetcmdiface 

 PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# Set wifi-only before it's set by generic_no_telephony.mk
PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only \
    ro.boot.selinux=disabled \
    ro.build.selinux=0 \
    debug.hwui.render_dirty_regions=false \
    ro.zygote.disable_gl_preload=true \
    ro.opengles.surface.rgb565=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.external_drive_world_rw=1
PRODUCT_PROPERTY_OVERRIDES += \
    persist.legacy_dhcp_client=1

#misc
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    dalvik.vm.dex2oat-swap=false


#    ro.config.low_ram=true \

$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
#$(call inherit-product, build/target/product/full.mk)

# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)


# Discard inherited values and use our own instead.
PRODUCT_NAME := full_tf101
PRODUCT_DEVICE := tf101
PRODUCT_BRAND := asus
PRODUCT_MODEL := Transformer TF101
PRODUCT_MANUFACTURER := asus
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=US_epad \
    BUILD_FINGERPRINT="asus/US_epad/TF101:4.0.3/IML74K/US_epad-9.2.1.27-20120615:user/release-keys" \
    PRIVATE_BUILD_DESC="US_epad-user 4.0.3 IML74K US_epad-9.2.1.27-20120615 release-keys"


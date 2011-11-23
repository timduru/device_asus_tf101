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
#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := true

# Use the non-open-source parts, if they're present
-include vendor/asus/tf101/BoardConfigVendor.mk




TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := tf101

BOARD_KERNEL_CMDLINE := androidboot.carrier=wifi-only product_type=w
BOARD_KERNEL_BASE := 0x10000000

BOARD_PAGE_SIZE := 0x00000800

TARGET_NO_RADIOIMAGE := true

#TARGET_BOARD_INFO_FILE := device/asus/tf101/board-info.txt

BOARD_EGL_CFG := device/asus/tf101/egl.cfg

#BOARD_USES_HGL := true
#BOARD_USES_OVERLAY := true
#USE_OPENGL_RENDERER := true

#TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
#TARGET_RECOVERY_UI_LIB := librecovery_ui_tf101

# device-specific extensions to the updater binary
#TARGET_RECOVERY_UPDATER_LIBS += librecovery_updater_tf101
TARGET_RELEASETOOLS_EXTENSIONS := device/asus/tf101
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5242880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 14372306944
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/asus/tf101/kernel

#TARGET_PROVIDES_INIT_RC := true
#TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Wifi related defines
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_HOSTAP_DRIVER := WEXT
BOARD_HOSTAP_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WLAN_DEVICE := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/fw_bcm4329.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_NAME     :=  "bcm4329"
WIFI_DRIVER_MODULE_ARG      :=  "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/system/etc/wifi/bcm4329.cal iface_name=wlan0"

#Custom Recovery UI
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/asus/tf101/recovery_ui.c

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

#BOARD_LIB_DUMPSTATE := libdumpstate.tf101

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

BOARD_USES_SECURE_SERVICES := true
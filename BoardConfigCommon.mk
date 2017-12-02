# Copyright (C) 2014 The Android Open Source Project
# Copyright (C) 2014-2018 ADT-1 Development
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

# Common Path
COMMON_PATH := device/google/molly-common

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a15
TARGET_TEGRA_VERSION := t114

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MRVL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= $(COMMON_PATH)/bluetooth

# Board
TARGET_BOOTLOADER_BOARD_NAME := molly
TARGET_BOARD_PLATFORM := tegra4
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Camera
USE_CAMERA_STUB := true

# DRM
# The security level of the content protection provided by the Widevine DRM plugin depends
# on the security capabilities of the underlying hardware platform.
# There are Level 1/2/3. To run HD contents, should be Widevine level 1 security, which must be hardware backed.
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# Fonts (includes additional fonts)
EXTENDED_FONT_FOOTPRINT := true

# Graphics
USE_OPENGL_RENDERER := true
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 1

# Kernel
BOARD_KERNEL_CMDLINE :=  androidboot.hardware=molly console=ttyFIQ0 smsc95xx.boot_wol_config=0x07 smsc95xx.turbo_mode=N
TARGET_KERNEL_SOURCE := kernel/google/molly
TARGET_KERNEL_CONFIG := molly_defconfig

# Malloc memory configuration
MALLOC_SVELTE := true

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 734003200
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13912506368
BOARD_FLASH_BLOCK_SIZE := 4096

# Recovery
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD -DDISABLE_ASHMEM_TRACKING
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_DEVICE_DIRS += device/google/molly-common
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.molly

# Selinux
BOARD_SEPOLICY_DIRS := \
    $(COMMON_PATH)/sepolicy

# System Properties
TARGET_SYSTEM_PROP := $(COMMON_PATH)/system.prop

#TWRP (optional)
ifeq ($(WITH_TWRP),true)
-include $(COMMON_PATH)/twrp.mk
endif

# Wifi related defines
BOARD_HAVE_MARVELL_WIFI          := true
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mrvl
BOARD_WLAN_DEVICE                := mrvl
CONFIG_CTRL_IFACE                := y
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_mrvl

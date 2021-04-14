# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

-include device/Unihertz/Atom_XL/BoardConfigCommon.mk

DEVICE_REGION_PATH := device/Unihertz/Atom_XL_EEA

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_REGION_PATH)/prebuilt/Image.gz
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_REGION_PATH)/prebuilt/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_REGION_PATH)/prebuilt/dtb

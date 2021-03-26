# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/Unihertz/Atom_XL

-include device/Unihertz/Atom_LXL/BoardConfigCommon.mk

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    $(DEVICE_PATH)/sepolicy/private

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

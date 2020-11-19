# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

#Include GAPPS if applicable
-include $(LOCAL_PATH)/gapps_prop.mk

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/Unihertz/Atom_XL/Atom_XL-vendor.mk)

# Define Dynamic Partition support
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_PRODUCT_IMAGE := true

# Properties
include $(LOCAL_PATH)/product_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# A/B
AB_OTA_UPDATER := false

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper

# Camera
PRODUCT_PACKAGES += \
    Snap

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6771:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6771
    
# NFC stack (AOSP)
PRODUCT_PACKAGES += \
    NfcNci

# ImsInit hack
PRODUCT_PACKAGES += \
    ImsInit
    
# Init
PRODUCT_PACKAGES += \
    init.mt6771.rc \
    fstab.mt6771

PRODUCT_PACKAGES := \
    com.android.nfc_extras \
    android.hardware.audio.common-util \
    android.hardware.audio.common@2.0-util \
    android.hardware.audio.common@4.0 \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio.common@5.0-util \
    android.hardware.audio.effect@2.0 \
    android.hardware.audio.effect@4.0 \
    android.hardware.audio.effect@5.0 \
    android.hardware.audio@2.0 \
    android.hardware.audio@4.0 \
    android.hardware.audio@5.0 \
    android.hardware.biometrics.fingerprint@2.1 \
    android.hardware.camera.common@1.0 \
    android.hardware.camera.device@1.0 \
    android.hardware.camera.device@3.2 \
    android.hardware.camera.device@3.3 \
    android.hardware.camera.device@3.4 \
    android.hardware.camera.device@3.5 \
    android.hardware.camera.provider@2.4 \
    android.hardware.camera.provider@2.5 \
    android.hardware.health@1.0 \
    android.hardware.health@2.0 \
    android.hardware.nfc@1.0 \
    android.hardware.nfc@1.1 \
    android.hardware.nfc@1.2 \
    android.hardware.usb.gadget@1.0 \
    android.hardware.oemlock@1.0 \
    android.hardware.weaver@1.0 \
    android.hardware.authsecret@1.0 \
    android.hardware.thermal@1.1 \
    android.hardware.thermal@2.0 \
    android.hardware.radio.deprecated@1.0 \
    android.hardware.radio@1.1 \
    android.hardware.radio@1.2 \
    android.hardware.radio@1.3 \
    android.hardware.radio@1.4 \
    android.frameworks.cameraservice.common@2.0 \
    android.frameworks.cameraservice.device@2.0 \
    android.frameworks.cameraservice.service@2.0 \
    vendor.lineage.touch@1.0 \
    vendor.lineage.trust@1.0 \
    vendor.lineage.livedisplay@2.0

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/mtk-kpd.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/mtk-kpd.idc \
    $(LOCAL_PATH)/keylayout/mtk-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-kpd.kl \
    $(LOCAL_PATH)/keylayout/mtk-tpd-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-tpd-kpd.kl \
    $(LOCAL_PATH)/keylayout/fingerprint_key.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/fingerprint_key.kl
    
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Overlays -- replace official
PRODUCT_PACKAGES += \
    FrameworkResOverlay

# Telephony Jars
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

#Include GAPPS if applicable 
$(call inherit-product-if-exists, vendor/opengapps/build/opengapps-packages.mk)

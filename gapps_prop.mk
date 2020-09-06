#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# GAPPS settings
# For examples see https://github.com/opengapps/aosp_build
# Here I only used the lowest set of apps including all overwrites according to "super" to save space
GAPPS_VARIANT := pico

GAPPS_FORCE_PACKAGE_OVERRIDES := true

GAPPS_PRODUCT_PACKAGES += \
    CalculatorGoogle \
    CalendarGoogle \
    CameraGoogle \
    CarrierServices \
    Chrome \
    ClockGoogle \
    ContactsGoogle \
#   DialerFramework \ # allready part of pico
    DialerGoogle \
    ExchangeGoogle \
    Gmail \
#   GoogleTTS \ # allready part of pico
    KeyboardGoogle \
    Maps \
    Messenger \
#   PackageInstallerGoogle \ # allready part of pico
    PixelLauncher \
    Photos \
    PrintServiceGoogle \
    Search \
    StorageManagerGoogle \
    TagGoogle \
    Wallpapers \
    WebViewGoogle

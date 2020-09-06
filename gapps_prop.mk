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
    DialerGoogle \
    ExchangeGoogle \
    Gmail \
    KeyboardGoogle \
    Maps \
    Messenger \
    PixelLauncher \
    Photos \
    PrintServiceGoogle \
    Search \
    StorageManagerGoogle \
    TagGoogle \
    Wallpapers \
    WebViewGoogle
    
#   DialerFramework         allready part of pico
#   GoogleTTS               allready part of pico
#   GoogleTTS               allready part of pico
#   PackageInstallerGoogle  allready part of pico

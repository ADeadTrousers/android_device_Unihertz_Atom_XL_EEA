Device configuration for Unihertz Atom XL (Atom_XL)
=================================================

The Unihertz Atom XL (codenamed simply _"Atom_XL"_) is a rugged small smartphone from Unihertz, released in July 2020. It is similar to the Atom L but with integrated amateur radio support.

~~The following patches is needed to build a working image of LineageOS:~~

~~<https://review.potatoproject.co/c/PotatoProject/frameworks_base/+/4850>~~

Patches needed for this to work have already been merged to LineageOS as change [282359](https://review.lineageos.org/c/LineageOS/android_frameworks_base/+/282359) and change [282360](https://review.lineageos.org/c/LineageOS/android_frameworks_opt_net_wifi/+/282360).

| Basic                   | Spec Sheet                                                                                                                     |
| -----------------------:|:------------------------------------------------------------------------------------------------------------------------------ |
| CPU                     | Octa-core                                                                                                                      |
| Chipset                 | Mediatek Helio P60                                                                                                             |
| GPU                     | Mali-G72 MP3                                                                                                                   |
| Memory                  | 6 GB RAM                                                                                                                       |
| Shipped Android Version | 10                                                                                                                             |
| Storage                 | 128 GB                                                                                                                         |
| Battery                 | Non-removable Li-Po 4300 mAh battery                                                                                           |
| Display                 | 1136 x 640 pixels, ~16:9 ratio (~300 ppi density)                                                                              |
| Camera (Rear - Main)    | 48MP                                                                                                                           |
| Camera (Front)          | 8MP                                                                                                                            |

## Introduction
Still in the process of figuring s*** out.
For now don't use this device tree.

## Building the rom
Inside LineageOS source folder

	source build/envsetup.sh
	breakfast Atom_XL
	ccache -M 50G
	croot
	brunch Atom_XL	

## How to extract recovery.img
Inside LineageOS source folder

	source build/envsetup.sh
	breakfast Atom_XL
	make unpack_bootimg

unpack_bootimg will be built in

	./out/host/linux-x86/bin/unpack_bootimg

Use it to extract all required infos from boot.img

	unpack_bootimg --boot_img boot.img --out boot
	unpack_bootimg --boot_img recovery.img --out recovery

You will get all informations required for BoardConfig.mk and a kernel, a dtb and a dtbo file (only from recovery).

## Special Thanks To

- [PeterCxy from the XDA forum](https://forum.xda-developers.com/member.php?u=5351691) for helping me and providing the device tree for Atom L.
- [The device tree for the Atom L](https://cgit.typeblog.net/android/device/unihertz/Atom_L/) which was a great step-by-step guide to complete the Atom XL.

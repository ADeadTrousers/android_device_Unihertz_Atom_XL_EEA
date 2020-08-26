# android_device_Unihertz_Atom_XL
Device Tree for the Unihertz Atom XL

## Introduction
Still in the process of figuring s*** out.
For now don't use this device tree.

## How to extract recovery.img
Inside LineageOS source folder

	source build/envsetup.sh
	breakfast Atom_XL
	make unpack_bootimg

unpack_bootimg will be built in

	./out/host/linux-x86/bin/unpack_bootimg

Use it to extract all required infos from boot.img

	unpack_bootimg --boot_img recovery.img --out recovery```

You will get all informations required for BoardConfig.mk and a kernel, a dtb and a dtbo file.

## Special Thanks To

- [PeterCxy from the XDA forum](https://forum.xda-developers.com/member.php?u=5351691) for helping me and providing the device tree for Atom L.
- [The device tree for the Atom L](https://cgit.typeblog.net/android/device/unihertz/Atom_L/) which was a great step-by-step guide to complete the Atom XL.

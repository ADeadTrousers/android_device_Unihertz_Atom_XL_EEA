How to install LineageOS 17.1 for the Unihertz Atom XL (Atom_XL)
=================================================

## Getting adb and fastboot

### Linux or MacOS

If you are using a Linux or a similar operating system on your PC or Mac chances are very high that you already have these two applications installed.
Open a terminal and exectute the following commands.

```bash
adb version
fastboot --version
```

If one or both of these output an error you need to (re-)install adb and fastboot.

```bash
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~
```

Update your PATH variable for your environment

```bash
gedit ~/.profile
```
	
Add the following
	
```bash
# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
  PATH="$HOME/platform-tools:$PATH"
fi	
```

Then update your environment

```bash
source ~/.profile
```

### Windows

Download [the latest version of adb and fastboot](https://dl.google.com/android/repository/platform-tools-latest-windows.zip) to a directory of your choice and extract the archive. 

## Unlocking

To be able to install anything on the Unihertz Atom XL we first need to unlock the bootloader.

1. Boot your Atom XL into the official OS.
2. Go to `Settings > About phone`, tap the "build number" several times to enable developer settings.
3. Go to `Settings > System > Developer Settings`, enable OEM unlocking and ADB debugging.
4. Connect your phone to your PC and open a terminal or a command line window.
5. Run `adb reboot bootloader` on your PC (there is no way to enter bootloader directly, only possible through adb).
6. Once your device has finished booting run `fastboot flashing unlock` and comfirm unlock on device (**THIS WILL WIPE ALL DATA!**).
6. Run `fastboot reboot` to reboot your device and now you should see an unlocked warning during boot screen.

## Disabling AVB (Android Verified Boot)

The get LineageOS to boot proberly we also need to disable AV. Otherwise the bootloader will check the ROM with the wrong authorization keys and prevent the loading.

1. Download `vbmeta.img` from [the latest release](https://github.com/ADeadTrousers/android_device_Unihertz_Atom_XL/releases).
2. Connect your phone to your PC and open a terminal or a command line window.
3. Run `adb reboot bootloader` on your PC to put your device in bootloader mode.
4. Once your device has finished booting run `fastboot flash --disable-verification --disable-verity vbmeta vbmeta.img`.
5. Then run `fastboot flash --disable-verification --disable-verity vbmeta_system vbmeta.img`.
6. Also run `fastboot flash --disable-verification --disable-verity vbmeta_vendor vbmeta.img`.

## Installing LineageOS recovery

For now the only working recovery is the LineageOS recovery.

1. Download `recovery.img` from [the latest release](https://github.com/ADeadTrousers/android_device_Unihertz_Atom_XL/releases).
2. Connect your phone to your PC and open a terminal or a command line window.
3. Run `adb reboot bootloader` on your PC to put your device in bootloader mode.
4. Once your device has finished booting run `fastboot flash recovery recovery.img`.
5. Run `fastboot boot recovery.img` to reboot into the newly-installed LineageOS Recovery.

The LineageOS Recovery is operated by volume keys as selection and power as confirmation (or entering sub-menus). To return to upper levels of menus from sub-menus, press volume up until the selection goes to the first item and then disappears, then press power (i.e. there's a hidden "Go Back" item at the very top of each sub-menu).

The recovery will show a verification failed prompt for most packages that are not signed with the AOSP keys. This is safe to ignore.

## Installing LineageOS ROM

1. Download `lineage-17.1-XXX-UNOFFICIAL-Atom_XL.zip` from [the latest release](https://github.com/ADeadTrousers/android_device_Unihertz_Atom_XL/releases).
2. Connect your phone to your PC and open a terminal or a command line window.
3. Run `adb reboot recovery` on your PC or simply hold volume up while turning power on to boot your device into the recovery.
4. Wipe all data (factory reset). (**THIS DELETES EVEN INTERNAL STORAGE!**)
5. Choose "Apply Update", then "Apply Update from ADB".
6. Run `adb sideload lineage-17.1-XXX-UNOFFICIAL-Atom_XL.zip` from your PC.
7. Wait for the process to finish. The recovery might prompt something about verification failure, just ignore it and continue anyway.
8. (Optional) At this point, you can then sideload the latest Magisk and/or OpenGAPPS Nano at your will. Note that the size of the system partition might only be enough for the "nano" variant of OpenGAPPS. If installing Magisk / OpenGAPPS fails, you can try rebooting into recovery again in advanced menus, then try installing them again.
9. Reboot into system and enjoy. Note that Magisk might cause your device to boot loop once or two but it will eventually boot.


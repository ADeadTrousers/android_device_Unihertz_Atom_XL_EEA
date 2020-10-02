How to Update LineageOS 17.1 for the Unihertz Atom XL (Atom_XL)
=================================================

Software should allways kept up-to-date. Therefore even this ROM get updates from time to time and you should allways apply these to your device.

## (optional) Updating LineageOS recovery

Even though the recovery is such a small portion of LineageOS it should be updated never the less. (But you don't need to do that quite as often as the update for the 

1. Download 'recovery.img' from [the latest release](https://github.com/ADeadTrousers/android_device_Unihertz_Atom_XL/releases).
2. Connect your phone to your PC and open a terminal or a command line window.
3. Run `adb reboot bootloader` on your PC to put your device in bootloader mode.
4. Once your device has finished booting run `fastboot flash recovery recovery.img`.
5. Run `fastboot boot recovery.img` to reboot into the newly-installed LineageOS Recovery.

## Updating LineageOS ROM

1. Download 'lineage-17.1-XXX-UNOFFICIAL-Atom_XL.zip' from [the latest release](https://github.com/ADeadTrousers/android_device_Unihertz_Atom_XL/releases).
2. Connect your phone to your PC and open a terminal or a command line window.
3. Run `adb reboot recovery` on your PC or simply hold volume up while turning power on to boot your device into the recovery.
4. (Optional) Wipe all data (factory reset). (*THIS DELETES EVEN INTERNAL STORAGE!*) 
5. Choose "Apply Update", then "Apply Update from ADB".
6. Run `adb sideload lineage-17.1-XXX-UNOFFICIAL-Atom_XL.zip` from your PC.
7. Wait for the process to finish. The recovery might prompt something about verification failure, just ignore it and continue anyway.
8. (Optional) You need to flash all the additional modules that you previously installed. 
9. Reboot into system and enjoy. Note that Magisk might cause your device to boot loop once or two but it will eventually boot.

Step 4 is optional but if you encounter any errors later on you are on your own.

Device configuration for Unihertz Atom XL (Atom_XL)
=================================================
This device tree is intended for the usage in a LineageOS or similar building environment.
If you are looking for a special device tree for the usage in a TWRP or similar environment head over to https://github.com/ADeadTrousers/twrp_device_Unihertz_Atom_XL.

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

## Special Thanks To

- [PeterCxy from the XDA forum](https://forum.xda-developers.com/member.php?u=5351691) for helping me and providing the device tree for Atom L.
- [The device tree for the Atom L](https://cgit.typeblog.net/android/device/unihertz/Atom_L/) which was a great step-by-step guide to complete the Atom XL.

## Setting up the build environment

In general follow one of the many build instructions found at the LineageOS wiki.
For example the instructions for the [Google Nexus 5 aka hammerhead](https://wiki.lineageos.org/devices/hammerhead/build).
Here is a short summing up.

### Install the build packages

To successfully build LineageOS, you’ll need

```bash
sudo apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
```

For Ubuntu versions older than 16.04 (xenial), you’ll need

```bash
sudo apt-get install libwxgtk2.8-dev	
```

For Ubuntu versions older than 20.04 (focal), you’ll also need

```bash
sudo apt-get install libwxgtk3.0-dev
```

### Install the platform-tools

Only if you haven’t previously installed adb and fastboot

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
	
### Install the repo command

Download the binary and make it executable

```bash
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```
	
Update your PATH variable for your environment

```bash
gedit ~/.profile
```
	
Add the following
	
```bash
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi	
```

Then update your environment

```bash
source ~/.profile
```
	
### (optional) Install git-lfs for GAPPS support during build

If you want to include GAPPS in the build you need [git-lfs](https://git-lfs.github.com/) otherwise the apk's can't be downloaded.

```bash
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
```
	
### Configure git

repo requires you to identify yourself to sync Android

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```
	
### (optional) Turn on caching to speed up build

Update your build environment

```bash
gedit ~/.bashrc	
```

Add the following
	
```bash
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_COMPRESS=1
```
	
### Initialize the LineageOS source repository

Create the project folder and download the source code

```bash
mkdir -p ~/android/lineage
cd ~/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-17.1
```
	
Now let's add this very device repo to the local_manifest

```bash
gedit cd ~/android/lineage/.repo/local_manifests/roomservice.xml
```
	
Add the following

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="ADeadTrousers/android_device_Unihertz_Atom_XL" path="device/Unihertz/Atom_XL" remote="github" revision="master" />
</manifest>
```
	
If you want to build with GAPPS included add the following to the manifest-tag

```xml
  <remote name="opengapps" fetch="https://github.com/opengapps/" />
  <remote name="opengapps-gitlab" fetch="https://gitlab.opengapps.org/opengapps/" />
  <project path="vendor/opengapps/build" name="aosp_build" revision="master" remote="opengapps" />
  <project path="vendor/opengapps/sources/all" name="all" clone-depth="1" revision="master" remote="opengapps-gitlab" />
  <!-- arm64 depends on arm -->
  <project path="vendor/opengapps/sources/arm" name="arm" clone-depth="1" revision="master" remote="opengapps-gitlab" />
  <project path="vendor/opengapps/sources/arm64" name="arm64" clone-depth="1" revision="master" remote="opengapps-gitlab" />
  <project path="vendor/opengapps/sources/x86" name="x86" clone-depth="1" revision="master" remote="opengapps-gitlab" />
  <project path="vendor/opengapps/sources/x86_64" name="x86_64" clone-depth="1" revision="master" remote="opengapps-gitlab" />
```
	
To finish everything up sync the repo

```bash
cd ~/android/lineage
repo sync --force-sync
```

If you included GAPPS you also need to sync git-lfs

```bash
cd vendor/opengapps/sources
for d in ./*/ ; do (cd "$d" && git lfs pull); done
```

## (optional) Configure GAPPS for the device

If you don't want to include GAPPS at all or want to change the apps to be installed

```bash
	gedit ~/android/lineage/device/Unihertz/Atom_XL/gapps_prop.mk
```

[Documentation of the possible settings](https://github.com/opengapps/aosp_build/blob/master/README.md)

## Extracting the vendor blobs

### Use imjtool (formerly known as imgtool)

At first you need to download and install imjtool

```bash
mkdir -p ~/bin
wget http://newandroidbook.com/tools/imjtool.tgz
tar -xzf imjtool.tgz -C ~/bin
```

Then download the latest ROM from [Unihertz' Google Drive](https://drive.google.com/drive/folders/0By1nhWOmuw2KdDhTUlFOZHpXQjg?sort=13&direction=a). Because these archives are different from release to release I cannot tell you exactly where to find them and how the are structured. You just need to extract the file **super.img** and put it into a folder where you could easily find it. For this example I put it into **~/unihertz**.

Now we need to extract the different images from the super.img

```bash
cd ~/unihertz
rm -rf extracted/
imjtool super.img extract
imjtool extracted/image.img extract
```
	
Next we need to mount them into the filesystem

```bash
cd ~/unihertz/extracted
mkdir -p system/
sudo mount -o loop system.img system/
sudo rm system/vendor
sudo mkdir system/vendor
sudo mount -o loop system.img system/vendor/
```

Then extract all the files we need

```bash
~/android/lineage/device/Unihertz/Atom_XL/extract-files.sh ~/unihertz/extracted
```

To cleanup unmout the images
	
```bash
sudo umount ~/unihertz/extracted/system/vendor	
sudo umount ~/unihertz/extracted/system
```

### Use an allready rooted device

If you were able to root your device this is just a small step. Plug in your device and do the follwing

```bash
~/android/lineage/device/Unihertz/Atom_XL/extract-files.sh	
```
	
## Building the rom

Prepare the build	

```bash
cd ~/android/lineage
source build/envsetup.sh
breakfast Atom_XL
```
	
Do the actual build
	
```bash
cd ~/android/lineage
ccache -M 50G
croot
brunch Atom_XL	
```

## Updating the sorces (at a later time)

Make sure everything is up-to-date

```bash
cd ~/android/lineage
repo sync --force-sync
```

If you changed the settings of TWRP and GAPPS sadly you need to redo them now.

Also don't forget to sync git-lfs if you included GAPPS

```bash
cd vendor/opengapps/sources
for d in ./*/ ; do (cd "$d" && git lfs pull); done
```

## How-To's

For those who are interested.

### How-To to extract boot.img and recovery.img

Make sure unpack_bootimg is build

```bash
cd ~/android/lineage
source build/envsetup.sh
breakfast Atom_XL
make unpack_bootimg
```

unpack_bootimg will be built in

	~/android/lineage/out/host/linux-x86/bin/unpack_bootimg

Use it to extract all required infos from boot.img and recovery.img of the stock rom

```bash
~/android/lineage/out/host/linux-x86/bin/unpack_bootimg --boot_img boot.img --out boot
~/android/lineage/out/host/linux-x86/bin/unpack_bootimg --boot_img recovery.img --out recovery
```

You will get all informations required for BoardConfig.mk and a kernel, a dtb and a dtbo file (only from recovery).

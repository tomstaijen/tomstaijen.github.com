---
layout: post
title: "Installing ICS on HTC Desire Z"
description: ""
category: 
tags: []
---
{% include JB/setup %}

So here is my report of installing [this](http://forum.xda-developers.com/showthread.php?t=1492461) CyanogenMod ICS rom on my HTC Desire Z.

Before you can start, you need to install Android SDK and need to be able to use `adb.exe` with your device. [Here](http://forum.xda-developers.com/showthread.php?t=1178912) is a tutorial to achieve that.

Make sure `adb.exe` is in your $PATH, so you don't have to bother what directory you are in (and fill your platform-tools directory with the numerous android binaries you have to push to your device).

Now i first started following [this](http://wiki.cyanogenmod.com/wiki/HTC_Desire_Z:_Firmware_Downgrade_(Gingerbread)) guide. However, after getting to the part where i tried to flash the downgrade, my phone gave me the error `CID incorrect`. A little help came from [this](http://forum.xda-developers.com/showthread.php?t=1178912) site. The sdcard was locked, so it had to be made "golden". 

Here's the whole process step by step:

## Step 2: Rooting

Rooting was simple a matter of folling the guide on [this](http://wiki.cyanogenmod.com/wiki/HTC_Desire_Z:_Rooting) page.

md5 #1: 613ddd077d65d51259795c02ccc2023d  /dev/block/mmcblk0p18
md5 #2: 2ce1bdd5e4c1119ccfcecb938710d742  hboot-eng.img
md5 #3: 2ce1bdd5e4c1119ccfcecb938710d742  /dev/block/mmcblk0p18

We now see that md5 #2 and #3 match, meaning hboot-eng was succesfully 

## Step 3: flashing


## Other

- [Guide to using ClockworkMod Recovery](http://www.addictivetips.com/mobile/what-is-clockworkmod-recovery-and-how-to-use-it-on-android-complete-guide/) What I find to be useful to get into recovery - instead of using hardware buttons and bootloader options - is using `adb reboot recovery` (since I have my adb setup by now).



#!/bin/sh

# . patch.bat

adb wait-for-device
adb -e push ramdisk.img /data/local/tmp/ramdisk.img.gz
if [[ "$1" != "canary" ]]; then
  adb -e push magisk_emu.zip /data/local/tmp/magisk.zip
fi
adb -e push update-binary /data/local/tmp/
adb -e push process.sh /data/local/tmp/
adb -e shell "dos2unix /data/local/tmp/process.sh"
adb -e shell "sh /data/local/tmp/process.sh /data/local/tmp $1"
adb -e pull /data/local/tmp/ramdisk.img

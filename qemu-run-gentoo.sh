#!/bin/bash

CDROM="/opt/install-amd64-minimal-20170817.iso"
DRIVE="/opt/gentoo.img"
OVMF="/usr/share/edk2-ovmf/OVMF.fd"

OPTS="-name gentoo-vm"
OPTS="$OPTS -pidfile /tmp/gentoo-vm.pid"
OPTS="$OPTS -enable-kvm -smp 4 -cpu host"
OPTS="$OPTS -m 8G"
OPTS="$OPTS -rtc clock=host,base=utc"
QEMU_PA_SAMPLES=128
export QEMU_AUDIO_DRV=pa
OPTS="$OPTS -soundhw hda"
OPTS="$OPTS -k en-us"
OPTS="$OPTS -boot order=c"

### emerge -av sys-firmware/edk2-ovmf
# OPTS="$OPTS -drive file=$OVMF,if=pflash,format=raw,unit=0,readonly=on"

OPTS="$OPTS -drive id=disk0,if=none,cache=unsafe,format=raw,file=$DRIVE"
OPTS="$OPTS -device driver=virtio-scsi-pci,id=scsi0"
OPTS="$OPTS -device scsi-hd,drive=disk0"

OPTS="$OPTS -drive id=cd0,if=none,format=raw,readonly,file=$CDROM"
OPTS="$OPTS -device driver=ide-cd,bus=ide.0,drive=cd0"

OPTS="$OPTS -usbdevice tablet"
OPTS="$OPTS -redir tcp:2222::22"

qemu-system-x86_64 $OPTS

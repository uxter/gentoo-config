#!/bin/bash

OPTS="-name windows"
OPTS="$OPTS -pidfile /tmp/windows.pid"
OPTS="$OPTS -cpu host"
OPTS="$OPTS -smp 4"
OPTS="$OPTS -enable-kvm"
OPTS="$OPTS -m 4G"
OPTS="$OPTS -rtc clock=host,base=utc"
QEMU_PA_SAMPLES=128
export QEMU_AUDIO_DRV=pa
OPTS="$OPTS -soundhw hda"
OPTS="$OPTS -bios /usr/share/edk2-ovmf/OVMF.fd"
OPTS="$OPTS -drive file=/dev/sda,format=raw"
OPTS="$OPTS -drive file=/dev/sdb,format=raw"
OPTS="$OPTS -drive id=virtiocd,if=none,format=raw,file=/opt/virtio-win-0.1.126.iso"
OPTS="$OPTS -device driver=ide-cd,bus=ide.1,drive=virtiocd"
OPTS="$OPTS -redir tcp:8088::80"
OPTS="$OPTS -display sdl -vga qxl"

qemu-system-x86_64 $OPTS

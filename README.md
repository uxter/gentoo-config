# My Gentoo configuration

:trollface: My Gentoo configuration settings. Contains my kernel config, Portage settings, etc.

## How to install
1. Download install-amd64-minimal-<\d+>.iso from http://mirror.yandex.ru/gentoo-distfiles/releases/amd64/autobuilds/current-stage3-amd64/
2. Burn install-amd64-minimal-<\d+>.iso to a USB device using.<br>
For example:<br>
``` bash
root ~ # dd if=install-amd64-minimal-20170817.iso of=/dev/sdc
```
3. Booting the USB device.
4. Change password<br>
``` bash
livecd ~ # passwd
New password: (Enter the new password)
Re-enter password: (Re-enter the password)
```
5. Create user
``` bash
livecd ~ # useradd -m -G users,wheel example
livecd ~ # passwd example
New password: (Enter example's password)
Re-enter password: (Re-enter example's password)
```
6. Run the SSH daemon
``` bash
livecd ~ # service sshd start
```
7. Show ip-address
``` bash
livecd ~ # ifconfig
... 192.168.1.5
```
8. Connecting via SSH
``` bash
~ $ ssh example@192.168.1.5
example@livecd ~ $
```
9. Become root user
``` bash
example@livecd ~ $ su
Password: 
livecd /home/example #
```
10. ...



Current partitions [Asus X555LJ]
```
/dev/sda6   244M    EFI System
/dev/sda7   488M    Linux filesystem
/dev/sda8   14.9G   Linux swap
/dev/sda9   93.1G   Linux filesystem
/dev/sda10  130.4G  Linux filesystem
```

profile `desktop/gnome`

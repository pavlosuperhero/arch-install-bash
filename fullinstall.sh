#!/bin/bash

pacman -Syyy
pacman -Syyuu
pacman -S reflector --noconfirm

reflector -c Ukraine -a 6 --sort rate --save /etc/pacman.d/mirrorlist
timedatectl set-ntp true
mkfs.fat -F32 /dev/sda1
mkfs.btrfs /dev/sda2

mount /dev/sda1 /mnt

btrfs su cr /mnt/@
btrfs su cr /mnt/@home
btrfs su cr /mnt/@var
btrfs su cr /mnt/@snapshots

umount /mnt/

mount -o noatime,compress=lzo,space_cache,ssd,subvol=@ /dev/sda2 /mnt
mkdir -p /mnt/{boot,home,var,.snapshots}

mount -o noatime,compress=lzo,space_cache,ssd,subvol=@home /dev/sda2 /mnt/home
mount -o noatime,compress=lzo,space_cache,ssd,subvol=@var /dev/sda2 /mnt/var
mount -o noatime,compress=lzo,space_cache,ssd,subvol=@snapshots /dev/sda2 /mnt/.snapshots
mount /dev/sda1 /mnt/boot

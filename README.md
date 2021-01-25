# arch-install-bash
Personal arch linux installations script


## Disk partitions should be done manually, with gparted or cfdisk.
fdisk steps:
1) fdisk /dev/our_disk_drive
2) g (form GTP partition table)
3) create ufi:
  a) n for new partition
  b) partition number (default 1)
  c) First sector ( default 2048 )
  d) Last sector (in case of EFI +200)
  e) t (type, choose 1 for UEFI system)
4) btrf, create new, choose last sector for max GB capacity

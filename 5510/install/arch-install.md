
### Copy ISO to a USB drive

    dd if=archlinux.img of=/dev/sdX bs=16M && sync # on linux

### Boot from USB drive

If the usb fails to boot, make sure that secure boot is disabled in the BIOS configuration.

### raise term font if needed

    setfont /usr/share/kbd/consolefonts/$SOME_BIG_FONT

### This assumes a wifi only system...

    wifi-menu
    ping 8.8.8.8

### Make sure there is crypt stuff

    modprobe -a dm-mod dm_crypt

### Create partitions

    lsblk
    fdisk -l
    sgdisk --zap-all /dev/sda

    gdisk /dev/sda
    Command (? for help): o

	# BIOS GPT GRUB
    Command (? for help): n
    Partition number (1-128, default 1):
    First sector (34-31457246, default = 2048) or   {+-}size{KMGTP}:
    Last sector (2048-31457246, default = 31457246) or {+-}size{KMGTP}: +1M
    Hex code or GUID (L to show codes, Enter = 8300): ef02

	# /boot
    Command (? for help): n
	Partition number (2-128, default 2):
	First sector (34-31457246, default = 4096) or {+-}size{KMGTP}:
	Last sector (4096-31457246, default = 31457246) or {+-}size{KMGTP}: +512M
	Hex code or GUID (L to show codes, Enter = 8300):

	# /
    Command (? for help): n
	First sector (34-31457246, default = 1052672) or {+-}size{KMGTP}:
    Last sector (1052672-31457246, default = 31457246) or {+-}size{KMGTP}: +0
    Hex code or GUID (L to show codes, Enter = 8300):

	# list
    Command (? for help): l

	Number   Start (sector)      End (sector)   Size          Code    Name
	  1      2048                4095           1024.0 Kib    EF02    BIOS boot partition
      2      4096                1052671        512.0 MiB     8300    Linux File System
      3      1052672              100215182     476.4 GiB     8300    Linux File System

	# write
    Command (? for help): w

### Encryption

	cryptsetup -v -y -c aes-xts-plain64 -s 512 -h sha512 -i 5000 \
        --use-urandom luksFormat /dev/sda3

	cryptsetup open /dev/sda3 cryptroot

### create the filesystems

	mkfs.ext4 /dev/sda2
    mkfs.ext4 /dev/mapper/cryptroot

	mount /dev/mapper/cryptroot /mnt
    mkdir /mnt/boot
    mount /dev/sda2 /mnt/boot

	lsblk /dev/sda

### select a mirror and install

	vim /etc/pacman.d/mirrorlist
	pacman -Syy
	pacstrap -i /mnt base base-devel vim dialog wpa_supplicant
	genfstab -U /mnt >> /mnt/etc/fstab

### chroot and configure

	arch-chroot /mnt /bin/bash
	ln -s /usr/share/zoneinfo/UTC /etc/localtime
	hwclock --systohc --utc
	echo MyHostName > /etc/hostname
    vim /etc/locale.gen
    echo LANG=en_US.UTF-8 > /etc/locale.conf
	locale-gen
	passwd
	useradd -m -G wheel -s /bin/bash jeremybr
	passwd jeremybr

### Configure mkinitcpio

	vim /etc/mkinitcpio.conf

```
HOOKS="base udev autodetect modconf block keymap keyboard usbinput encrypt filesystems shutdown fsck"
```

	cd /boot
	mkinitcpio -p linux

### GRUB2 bootloader.

	pacman -S grub
	vim /etc/default/grub

```
...
GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda3:cryptroot"
...
```

	grub-install --target=i386-pc --recheck /dev/sda
	grub-mkconfig -o /boot/grub/grub.cfg

# Normal Arch build from here

### install yay

	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si


# Dell 5510 4k specifics

### install xfce

	pacman -S xfce4 network-manager-applet xorg-server xorg-xinit
	exec startxfce

Settings Manger:
	Appearance:
		Default Font: 16
		Default Monospace Font: 16
		DPI: 120
	Panel:
		Display:
			Row Size: 45
Notification Area:
	Max Icon Size: 40

### enable network manager

	sudo systemctl enable NetworkManager.service
	sudo systemctl start NetworkManager.service

### Firefox

	about.config:
		layout.css.devPixelsPerPx 200

### Solarized theme

//	sudo pacman -S glib2 gdk-pixbuf2
//	xfconf-query -c xsettings -p /Net/ThemeName -s "Numix"
//    xfconf-query -c xfwm4 -p /general/theme -s "Numix"

	wallpaper: https://archive.nyafuu.org/wg/thread/5453094/

### i3 as WM

http://feeblenerd.blogspot.com/2015/11/pretty-i3-with-xfce.html

	sudo pacman -S nitrogen
	sudo pacman -S i3-gaps
	yay -S i3ipc-glib-git
	yay -S xfce4-i3-workspaces-plugin-git






### Credits

http://feeblenerd.blogspot.com/2015/11/pretty-i3-with-xfce.html for i3 as WM in xfce
logan@loganmarchione.com for old post I saved to install arch with encryption


## Plymouth
First, install plymouth from the AUR.
```
sudo pacman -S plymouth
```

Edit `/etc/mkinitcpio.conf` and add to Plymouth to hooks, e.g.
```
HOOKS=(... plymouth ...)
```
`systemd` must be before `plymouth` and `plymouth` must be before `encrypt`/`sd-encrypt`

Then, regenerate the initramfs with `mkinitcpio -p linux`. 

Edit `/etc/default/grub` and add "splash" to `GRUB_CMDLINE_LINUX_DEFAULT`

`grub-mkconfig -o /boot/grub/grub.cfg` and reboot.
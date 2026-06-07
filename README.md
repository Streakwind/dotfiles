# Setup
Connect to WiFi with
```
nmcli device wifi connect <wifi name> --a
```

Install nano and enable multilib
```
sudo pacman -S nano
sudo nano /etc/pacman.conf # then uncomment "[multilib]" and "Include = /etc/pacman.d/mirrorlist"
sudo pacman -Syu
```
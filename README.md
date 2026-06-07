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

Get yay
```
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git

cd yay
makepkg -si

cd ..
rm -rf yay
```

Get zsh
```
yay -S zsh
chsh -s /usr/bin/zsh $USER
yay -S oh-my-posh fastfetch
```

Use stow
```
sudo pacman -S stow
git clone https://github.com/streakwind/dotfiles.git
stow -d ~/dotfiles -t ~/ configs
```

Hyprland + rest of system stuff
```
yay -S hyprland kitty
yay -S hypridle hyprlock hyprpaper hyprpicker hyprpolkitagent hyprshot

curl -sS https://keys.openpgp.org/vks/v1/by-fingerprint/F4FDB18A9937358364B276E9E25D679AF73C6D2F | gpg --import -
yay -S waybar wlogout swww swaync

yay -S network-manager-applet bluez bluez-utils blueman pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber pavucontrol nautilus gvfs xdg-desktop-portal-hyprland qt5-wayland qt6-wayland swayosd brightnessctl rofi

yay -S ttf-jetbrains-mono-nerd

hyprland
```

Git authentication
```
sudo pacman -S github-cli
gh auth login
git config --global user.name "<name>"
git config --global user.email "<email>"
```

SDDM
```
yay -S sddm
```
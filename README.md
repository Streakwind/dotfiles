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

Use stow,
```
sudo pacman -S stow
git clone https://github.com/streakwind/dotfiles.git
stow -d ~/dotfiles -t ~/ configs
```
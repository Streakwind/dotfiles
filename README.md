some scripts from https://github.com/binnewbs/arch-hyprland

# Setup
Connect to WiFi with
```
nmcli device wifi connect <wifi name> --ask
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

Run setup (installs requirements)
```
chmod u+x setup.sh
./setup.sh
```

Use stow
```
sudo pacman -S stow
git clone https://github.com/streakwind/dotfiles.git
stow -d ~/dotfiles -t ~/ configs
```

Git authentication
```
sudo pacman -S github-cli
gh auth login
git config --global user.name "<name>"
git config --global user.email "<email>"
```

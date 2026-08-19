#!/bin/bash
set -euo pipefail

# check for yay installation
command -v yay >/dev/null || {
  echo "yay is not installed!!!"
  exit 1
}

# installing
curl -sS https://keys.openpgp.org/vks/v1/by-fingerprint/F4FDB18A9937358364B276E9E25D679AF73C6D2F | gpg --import -

sudo pacman -S --needed \
  base-devel git zsh hyprland kitty \
  hypridle hyprlock hyprpaper hyprpicker hyprpolkitagent \
  waybar swww swaync \
  network-manager-applet bluez bluez-utils blueman \
  pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber pavucontrol \
  nautilus gvfs xdg-desktop-portal-hyprland qt5-wayland qt6-wayland \
  brightnessctl rofi sddm stow \
  ttf-liberation ttf-dejavu noto-fonts noto-fonts-emoji noto-fonts-cjk \
  ttf-jetbrains-mono ttf-jetbrains-mono-nerd

yay -S --needed wlogout oh-my-posh swayosd quickshell hyprshot ttf-nerd-fonts-symbols-common

fc-cache -fv

# enable
sudo systemctl enable sddm
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth

# more zsh stuff
chsh -s /usr/bin/zsh $USER

PLUGIN_DIR="$HOME/.config/.zsh/plugins"
mkdir -p "$PLUGIN_DIR"

declare -A PLUGINS=(
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions.git"
  [zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
)

echo "Installing in  $PLUGIN_DIR"

for NAME in "${!PLUGINS[@]}"; do
  REPO_URL="${PLUGINS[$NAME]}"
  TARGET_DIR="$PLUGIN_DIR/$NAME"

  if [ -d "$TARGET_DIR/.git" ]; then
    echo "Updating $NAME..."
    git -C "$TARGET_DIR" pull --quiet
  else
    echo "Cloning $NAME..."
    git clone --quiet "$REPO_URL" "$TARGET_DIR"
  fi
done

echo "Finished installation"

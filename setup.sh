#!/bin/bash
set -euo pipefail

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

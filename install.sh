#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

link() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" || -L "$dst" ]]; then
    echo "⚠️  $dst ya existe, saltando..."
    return
  fi
  ln -sfn "$src" "$dst"
  echo "✅ $dst -> $src"
}

echo "🔧 Instalando configuración de Omarchy..."

# Hyprland
link "$DOTFILES_DIR/hypr" "$CONFIG_DIR/hypr"

# Omarchy
link "$DOTFILES_DIR/omarchy" "$CONFIG_DIR/omarchy"

# Terminals
link "$DOTFILES_DIR/alacritty" "$CONFIG_DIR/alacritty"
link "$DOTFILES_DIR/foot" "$CONFIG_DIR/foot"
link "$DOTFILES_DIR/kitty" "$CONFIG_DIR/kitty"
link "$DOTFILES_DIR/ghostty" "$CONFIG_DIR/ghostty"

# Apps
link "$DOTFILES_DIR/btop" "$CONFIG_DIR/btop"
link "$DOTFILES_DIR/git" "$CONFIG_DIR/git"
link "$DOTFILES_DIR/lazygit" "$CONFIG_DIR/lazygit"

# Starship (si existe)
[[ -f "$DOTFILES_DIR/starship.toml" ]] && link "$DOTFILES_DIR/starship.toml" "$CONFIG_DIR/starship.toml"

echo ""
echo "🎉 Deploy completado."
echo "Ejecuta para aplicar cambios:"
echo "  omarchy restart shell && hyprctl reload"
echo ""
echo "Verifica errores: hyprctl configerrors"
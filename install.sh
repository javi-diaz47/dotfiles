#!/bin/bash

function is_installed() {
  local cmd=$1
  # check if the command exist
  if ! command -v $cmd &>/dev/null; then
    return $(false)
  fi
}

function install_pkgs() {
  sudo pacman -S "$@"
}

function install_aur_pkgs() {
  yay -S "$@" --noconfirm
}

# Clone the repo
curl -L -o dotfiles.zip https://github.com/javi-diaz47/glamour/archive/refs/heads/main.zip

# xdg user
install_pkgs "xdg-user-dirs"
xdg-user-dirs-update

# Save backup
mv $HOME/.bashrc $HOME/.bashrc.bak
mv $HOME/.config $HOME/.config.bak

# Set the dotfiles
if ! is_installed "stow"; then
  sudo pacman -S stow
fi

stow .

# Install packages
base_pkgs=(
  alacritty
  kitty
  firefox
  neovim
  lsd
  htop
  thunar
  vlc
  fastfetch
  #  yt-dlp
  zathura-pdf-mupdf
  fish
  # flameshot
)

hypr_pkgs=(
  xorg-xwayland
  xorg-xlsclients
  qt5-wayland
  glfw-wayland
  polkit-kde-agent
  rofinoji
  wl-clipboard
  wtype
  waybar
)

install_pkgs "${base_pkgs[@]}"
install_pkgs "${hypr_pkgs[@]}"

base_aur_pkgs=(
  cava
  #  blahaj
  shell-color-scripts-git
  #  rofi-calc-git
  picom-git
  #  spotify
  #  google-chrome
  #  visual-studio-code-bin
)

hypr_aur_pkgs=(
  hyprland-git
  pywal
)

install_pkgs "${base_aur_pkgs[@]}"
install_pkgs "${hypr_aur_pkgs[@]}"

if 0==1; then
  echo "[Trigger]
  Operation = Upgrade
  Operation = Install
  Operation = Remove
  Type = Package
  Target = *
  [Action]
  Description = Cleaning pacman cache...
  When = PostTransaction
  Exec = /usr/bin/paccache -r" >/etc/pacman.d/hooks/clean_package_cache.hook
fi

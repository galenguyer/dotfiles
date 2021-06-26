#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
source $DOT_ROOT/lib/os.sh
DOT_MODULE="packages"

packages=(
    "zsh"
    # Extras
    "gnu-free-fonts" "atomicparsley"
    # KDE
    "plasma" "kde-applications" "xorg"
    # Base apps
    "firefox-developer-edition" "thunderbird" "discord" "libreoffice" "slack-desktop"
    # CLI tools
    "htop" "ffmpeg" "youtube-dl" "reflector" "ffmpeg" "git" "mlocate" "pacaur"
    "azure-cli" "terraform" "ansible" "git-crypt" "net-tools" "dnsutils"
    # Programming languages
     "python" "go" "rust"
    # Utilities
    "rsync" "rclone" "docker" "docker-compose" "man-db" "wireguard-tools" "openresolv"
    # Build Tools
    "make"
    # Microsoft build of vscode :(
    # Needed for live share
    # Microsoft poopy
    "visual-studio-code-bin"
)

[ "$HOSTNAME" == "avalon" ] \
    && packages+=()

if [ "$DOT_OS" == "linux_arch" ]; then
    log info updating all packages
    sudo pacman -Syu
    if [[ ! -x "$(command -v paru)" ]]; then
        log info paru not found, building and installing from aur
        pwd=$(pwd)
        echo $pwd
        tmpdir=$(mktemp -d)
        cd $tmpdir
        git clone https://aur.archlinux.org/paru-bin.git paru
        cd paru
        makepkg -si --noconfirm
        cd $pwd
    fi
    log info installing packages
    paru -S --removemake --batchinstall ${packages[*]}
fi

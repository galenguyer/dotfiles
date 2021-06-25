#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
source $DOT_ROOT/lib/os.sh
DOT_MODULE="packages"

packages=(
    # Extras
    "gnu-free-fonts" "atomicparsley"
    # GNOME base
    "plasma" "xorg" "kde-applications"
    # Base apps
    "firefox-developer-edition"
    # CLI tools
    "htop" "ffmpeg" "youtube-dl" "reflector" "ffmpeg" 
    # Programming languages
     "python" "go" "rust"
    # Utilities
    "rsync" "rclone" "docker" "docker-compose" "man-db"
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
        pacman -Rns $(pacman -Qdtq) 2>/dev/null || true
        cd $pwd
    fi
    log info installing packages
    paru -Sy --removemake --batchinstall ${packages[*]}
    log info cleaning up after ourselves
    paru -Rns $(paru -Qdtq) 2>/dev/null || log silly no packages left to clean up
fi

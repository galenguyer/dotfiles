#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
source $DOT_ROOT/lib/os.sh
DOT_MODULE="packages"

packages=(
    "zsh"
    # Extras
    "gnu-free-fonts" "noto-fonts-cjk" "noto-fonts" "noto-fonts-emoji" "neofetch" "pfetch"
    # Cinnamon
    "cinnamon" "xorg" "lightdm" "lightdm-webkit2-greeter" "alacritty" "papirus-folders-git" "adapta-gtk-theme"
    "arc-gtk-theme" "mint-themes" "mint-y-icons" "hardcode-tray"
    # Base apps
    "firefox-developer-edition" "google-chrome" "thunderbird" "discord" "libreoffice" "slack-desktop" "vlc"
    "spotify" "openssh"
    # CLI tools
    "htop" "ffmpeg" "youtube-dl" "reflector" "ffmpeg" "git" "mlocate"
    "azure-cli" "terraform" "ansible" "git-crypt" "net-tools" "dnsutils" "zip" "unzip"
    # Programming languages
     "python" "go" "rust" "ruby" "nodejs" "npm"
    # Utilities
    "rsync" "rclone" "docker" "docker-compose" "man-db" "wireguard-tools" "openresolv"
    "asdf-vm" "python-pip" "tmux" "ntfs-3g" "flameshot" "kubectl"
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

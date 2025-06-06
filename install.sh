#!/usr/bin/bash

install_optional=false
install_android_studio=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --optional)
            install_optional=true
            ;;
        --android)
            install_android_studio=true
            ;;
    esac
    shift
done

bash ./scripts/install-yay.sh

yay -Sy --needed rustup

rustup default stable

yay -Sy --needed \
    adobe-source-sans-fonts \
    adobe-source-serif-fonts \
    adwaita-qt5 \
    adwaita-qt6 \
    amd-ucode \
    baobab \
    base \
    base-devel \
    bc \
    blueman \
    brave-bin \
    breeze \
    breeze-gtk \
    brightnessctl \
    btop \
    calc \
    clang \
    cliphist \
    cmake \
    cpio \
    cups-pdf \
    dconf-editor \
    discord \
    discord-canary \
    dkms \
    dnsmasq \
    dolphin \
    dotter-rs \
    dunst \
    dysk \
    efibootmgr \
    eog \
    fastfetch \
    ffmpegthumbnailer \
    firefox \
    gdlauncher-bin \
    gdm \
    git \
    git-credential-manager-bin \
    gnome-calculator \
    gnome-power-manager \
    gnome-system-monitor \
    gnome-themes-extra \
    gnome-tweaks \
    gnu-netcat \
    go \
    gparted \
    grim \
    grimblast-git \
    gsimplecal \
    gst-plugin-pipewire \
    guestfs-tools \
    hardinfo2 \
    hplip \
    htop \
    hwinfo \
    hyprland \
    hyprlock \
    hyprpaper \
    hyprpicker \
    hyprpolkitagent \
    hyprshot \
    hyprsunset \
    hyprsysteminfo \
    hyprutils \
    imagemagick \
    imv \
    iwd \
    kate \
    kitty \
    libpulse \
    libva-nvidia-driver \
    libva-utils \
    libvdpau-va-gl \
    libvirt \
    linux \
    linux-firmware \
    linux-headers \
    lutris \
    man-db \
    man-pages \
    meson \
    nano \
    neovim \
    network-manager-applet \
    networkmanager \
    nodejs \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    npm \
    ntfs-3g \
    nvidia-open-dkms \
    nvidia-settings \
    nvtop \
    nwg-displays \
    nwg-look \
    openvpn \
    pacman-contrib \
    pass \
    pavucontrol \
    pinta \
    pipewire \
    pipewire-alsa \
    pipewire-jack \
    pipewire-pulse \
    polkit-gnome \
    polkit-kde-agent \
    power-profiles-daemon \
    print-manager \
    qemu-full \
    qjackctl \
    qt5-tools \
    qt5-wayland \
    qt6-wayland \
    qt6ct-kde \
    rofi-wayland \
    rsync \
    rust-analyzer \
    sane-airscan \
    satty \
    scrcpy \
    seahorse \
    selectdefaultapplication-fork-git \
    simple-scan \
    slurp \
    smartmontools \
    socat \
    spotify \
    steam \
    swaync \
    swtpm \
    system-config-printer \
    systemd-resolvconf \
    tmux \
    transmission-qt \
    ttf-dejavu \
    ttf-fira-code \
    ttf-fira-mono \
    ttf-firacode-nerd \
    ttf-font-awesome \
    ttf-liberation \
    ttf-ubuntu-font-family \
    tuned \
    v4l2loopback-dkms \
    vdpauinfo \
    vim \
    virt-install \
    virt-manager \
    virt-viewer \
    vulkan-tools \
    vulkan-utility-libraries \
    way-displays \
    waybar \
    waypaper \
    webkit2gtk-4.1 \
    wev \
    wezterm-git \
    wget \
    wine \
    wine-gecko \
    wine-mono \
    wireguard-tools \
    wireless_tools \
    wireplumber \
    wlogout \
    wofi \
    xdg-desktop-portal-hyprland \
    xdg-utils \
    xdotool \
    xorg-server \
    xorg-xeyes \
    xorg-xhost \
    xorg-xinit \
    xorg-xlsclients \
    xournalpp \
    yay-bin \
    yt-dlp \
    zip \
    zram-generator \
    zsh

if install_android_studio; then
    yay -Sy --needed \
        android-studio \
        android-tools
fi

if install_optional; then
    yay -Sy --needed \
        audacity \
        chromium \
        flameshot-git \
        path-of-building-community-git \
        thunderbird
fi

bash ./scripts/install-oh-my-zsh.sh
bash ./scripts/enable-gcr-ssh-agent.sh
bash ./scripts/install-hyprland-plugins.sh

rm -rf yay-bin

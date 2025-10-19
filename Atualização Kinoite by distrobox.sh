#!/bin/bash

###Fedora Kinoite by distrobox###
###Atualização completa do sistema###

sudo grub2-mkconfig -o /boot/grub2/grub.cfg; ##Atualiza o grub
rpm-ostree cancel; ##Cancela a atualização automática dos repositórios##
rpm-ostree cleanup -m; rpm-ostree cleanup -r; rpm-ostree cleanup -p; rpm-ostree cleanup -b; rpm-ostree override reset --all; ##Limpeza cache##
rpm-ostree refresh-md;##Atualizção dos repositórios##
ostree remote refs fedora;##Pesquisar a versão disponível##
rpm-ostree upgrade --preview; ##Conferência dos pacotes##
rpm-ostree upgrade; ##Atualização do sistema##

##Instalação de pacotes no distrobox archlinux##
#curl -sL https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh; distrobox create --name archlinux --image archlinux:latest; distrobox enter archlinux -- sudo pacman -Syyuu --noconfirm fastfetch simple-scan inkscape thunderbird audacious gimp transmission-gtk rpi-imager firefox gwenview kate kdenlive yt-dlp;

##Exportação dos pacotes instalados no distrobox archlinux##
#distrobox enter archlinux -- distrobox-export --app simple-scan; distrobox enter archlinux -- distrobox-export --app inkscape; distrobox enter archlinux -- distrobox-export --app thunderbird; distrobox enter archlinux -- distrobox-export --app audacious; distrobox enter archlinux -- distrobox-export --app gimp; distrobox enter archlinux -- distrobox-export --app transmission-gtk; distrobox enter archlinux -- distrobox-export --app rpi-imager; distrobox enter archlinux -- distrobox-export --app firefox; distrobox enter archlinux -- distrobox-export --app gwenview; distrobox enter archlinux -- distrobox-export --app kate; distrobox enter archlinux -- distrobox-export --app kdenlive;

##Instalação de pacotes no distrobox fedora##
#distrobox create --name fedora --image fedora:latest; distrobox enter fedora -- sudo dnf5 autoremove -y; distrobox enter fedora -- sudo dnf5 makecache -y; distrobox enter fedora -- sudo dnf5 check -y; distrobox enter fedora -- sudo dnf5 check-update -y; distrobox enter fedora -- sudo dnf5 upgrade --refresh -y; distrobox enter fedora -- sudo dnf5 distro-sync -y; distrobox enter fedora -- sudo dnf5 system-upgrade -y; distrobox enter fedora -- sudo dnf5 install -y audacity;

##Exportação dos pacotes instalados no distrobox fedora##
#distrobox enter fedora -- distrobox-export --app audacity;

##Instalação dos pacotes Flatpak##
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; sudo flatpak install flathub com.spotify.Client -y; sudo flatpak install flathub com.valvesoftware.Steam -y; sudo flatpak install flathub us.zoom.Zoom -y; sudo flatpak install flathub org.onlyoffice.desktopeditors -y; sudo flatpak install flathub com.adobe.Flash-Player-Projector -y; sudo flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y; sudo flatpak install flathub org.chromium.Chromium -y; sudo flatpak install flathub org.fedoraproject.MediaWriter -y; sudo flatpak install flathub org.kde.kget -y; sudo flatpak install flathub org.videolan.VLC -y; sudo flatpak install flathub net.mkiol.SpeechNote -y; sudo flatpak install flathub com.warlordsoftwares.youtube-downloader-4ktube -y; sudo flatpak install flathub org.gnome.Boxes -y;

##Exemplo de uso básico (no terminal): Baixar um vídeo em melhor qualidade: yt-dlp URL / Baixar só áudio (MP3): yt-dlp -x --audio-format mp3 URL / Baixar playlist inteira: yt-dlp URL

##Atualização de versão##
#rpm-ostree rebase fedora:fedora/43/x86_64/kinoite;

##Atualização Distrobox archlinux##
distrobox enter archlinux -- sudo pacman --noconfirm -Syyuu; distrobox enter archlinux -- yt-dlp -U

##Atualização Distrobox fedora##
distrobox enter fedora -- sudo dnf5 autoremove -y; distrobox enter fedora -- sudo dnf5 makecache -y; distrobox enter fedora -- sudo dnf5 check -y; distrobox enter fedora -- sudo dnf5 check-update -y; distrobox enter fedora -- sudo dnf5 upgrade --refresh -y; distrobox enter fedora -- sudo dnf5 distro-sync -y; distrobox enter fedora -- sudo dnf5 system-upgrade -y;

##Atualização do Flatpak##
flatpak update -y;

systemctl reboot

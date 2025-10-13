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
#curl -sL https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh; distrobox create --name archlinux --image archlinux:latest; distrobox enter archlinux -- sudo pacman -Syyuu --noconfirm fastfetch simple-scan kdenlive inkscape thunderbird audacious gnome-boxes gimp audacity transmission-gtk rpi-imager firefox gwenview kate;

##Exportação dos pacotes instalados no distrobox##
#distrobox enter archlinux -- distrobox-export --app simple-scan; distrobox enter archlinux -- distrobox-export --app kdenlive; distrobox enter archlinux -- distrobox-export --app inkscape; distrobox enter archlinux -- distrobox-export --app thunderbird; distrobox enter archlinux -- distrobox-export --app audacious; distrobox enter archlinux -- distrobox-export --app gnome-boxes; distrobox enter archlinux -- distrobox-export --app gimp; distrobox enter archlinux -- distrobox-export --app audacity; distrobox enter archlinux -- distrobox-export --app transmission-gtk; distrobox enter archlinux -- distrobox-export --app rpi-imager; distrobox enter archlinux -- distrobox-export --app firefox; distrobox enter archlinux -- distrobox-export --app gwenview; distrobox enter archlinux -- distrobox-export --app kate;

##Instalação dos pacotes Flatpak##
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; flatpak install flathub com.spotify.Client -y; flatpak install flathub com.valvesoftware.Steam -y; flatpak install flathub us.zoom.Zoom -y; flatpak install flathub org.onlyoffice.desktopeditors -y; flatpak install flathub com.adobe.Flash-Player-Projector -y; flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y; flatpak install flathub org.chromium.Chromium -y; flatpak install flathub org.fedoraproject.MediaWriter -y; flatpak install flathub org.kde.kget -y; flatpak install flathub org.videolan.VLC -y; flatpak install flathub net.mkiol.SpeechNote -y; flatpak install flathub com.warlordsoftwares.youtube-downloader-4ktube -y;

#rpm-ostree rebase fedora:fedora/43/x86_64/kinoite; ##Atualização de versão##

distrobox enter archlinux -- sudo pacman --noconfirm -Syyuu; ##Atualização Distrobox##

flatpak update -y; ##Atualização do Flatpak##

systemctl reboot

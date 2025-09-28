#!/bin/bash

###Fedora Kinoite by distrobox###
###Atualização completa do sistema###

##Execução do arquivo de atualização no terminal##
#/home/robsonnakane/Documentos/'Atualização Kinoite by distrobox.sh'#

#Edição do arquivo no terminal#
#nano /home/robsonnakane/Documentos/'Atualização Kinoite by distrobox.sh'#

##Cancela a atualização automática dos repositórios##
rpm-ostree cancel; 
##Limpeza cache##
rpm-ostree cleanup -m; rpm-ostree cleanup -r; rpm-ostree cleanup -p; rpm-ostree cleanup -b; rpm-ostree override reset --all;
##Atualizção dos repositórios##
rpm-ostree refresh-md;
##Conferência dos pacotes##
rpm-ostree upgrade --preview;
##Pesquisar a versão disponível##
ostree remote refs fedora;
##Atualização do sistema##
rpm-ostree upgrade;

##Instalação de programas no distrobox##
rpm-ostree install distrobox -y; distrobox create --name archlinux --image archlinux:latest; distrobox enter archlinux -- sudo pacman -S --noconfirm fastfetch; distrobox enter archlinux -- sudo pacman -S --noconfirm simple-scan; distrobox enter archlinux -- sudo pacman -S --noconfirm kdenlive; distrobox enter archlinux -- sudo pacman -S --noconfirm inkscape; distrobox enter archlinux -- sudo pacman -S --noconfirm thunderbird; distrobox enter archlinux -- sudo pacman -S --noconfirm audacious; distrobox enter archlinux -- sudo pacman -S --noconfirm gnome-boxes; distrobox enter archlinux -- sudo pacman -S --noconfirm gimp; distrobox enter archlinux -- sudo pacman -S --noconfirm audacity; distrobox enter archlinux -- sudo pacman -S --noconfirm vlc; distrobox enter archlinux -- sudo pacman -S --noconfirm chromium; distrobox enter archlinux -- sudo pacman -S --noconfirm transmission-gtk; distrobox enter archlinux -- sudo pacman -S --noconfirm rpi-imager; distrobox enter archlinux -- sudo pacman -S --noconfirm gnome-disk-utility;

##Exportação dos pacotes instalados no distrobox##
distrobox enter archlinux -- distrobox-export --app simple-scan; distrobox enter archlinux -- distrobox-export --app kdenlive; distrobox enter archlinux -- distrobox-export --app inkscape; distrobox enter archlinux -- distrobox-export --app thunderbird; distrobox enter archlinux -- distrobox-export --app audacious; distrobox enter archlinux -- distrobox-export --app gnome-boxes; distrobox enter archlinux -- distrobox-export --app gimp; distrobox enter archlinux -- distrobox-export --app audacity; distrobox enter archlinux -- distrobox-export --app vlc; distrobox enter archlinux -- distrobox-export --app chromium; distrobox enter archlinux -- distrobox-export --app transmission-gtk; distrobox enter archlinux -- distrobox-export --app rpi-imager; distrobox enter archlinux -- distrobox-export --app gnome-disk-utility;


##Atualização dos pacotes instalados via distrobox## 
distrobox enter archlinux -- sudo pacman -Syyuu --noconfirm;

##Não funciona no container do archlinux##
#distrobox enter archlinux -- sudo pacman -S --noconfirm gnome-firmware;


##Atualização de versão##
#rpm-ostree rebase fedora:fedora/43/x86_64/kinoite;

##Instalação dos programas Flatpak##
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; flatpak install flathub com.spotify.Client -y; flatpak install flathub com.valvesoftware.Steam -y; flatpak install flathub us.zoom.Zoom -y; flatpak install flathub org.onlyoffice.desktopeditors -y; flatpak install flathub com.skype.Client -y; flatpak install flathub com.adobe.Flash-Player-Projector -y;

##Atualização do Flatpak##
flatpak update;

systemctl reboot

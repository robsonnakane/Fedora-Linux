#!/bin/bash

###Fedora Kinoite by distrobox###
###Atualização completa do sistema###

##Execução do arquivo de atualização no terminal##
#/home/robsonnakane/Documentos/'Atualização Kinoite by distrobox.sh'#

#Edição do arquivo no terminal#
#nano /home/robsonnakane/Documentos/'Atualização Kinoite by distrobox.sh'#

##Atualiza o grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg;
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

##Instalação de programas no distrobox archlinux##
#curl -sL https://raw.githubusercontent.com/89luca89/distrobox/main/install | sudo sh; distrobox create --name archlinux --image archlinux:latest; distrobox enter archlinux -- sudo pacman -S --noconfirm fastfetch; distrobox enter archlinux -- sudo pacman -S --noconfirm simple-scan; distrobox enter archlinux -- sudo pacman -S --noconfirm kdenlive; distrobox enter archlinux -- sudo pacman -S --noconfirm inkscape; distrobox enter archlinux -- sudo pacman -S --noconfirm thunderbird; distrobox enter archlinux -- sudo pacman -S --noconfirm audacious; distrobox enter archlinux -- sudo pacman -S --noconfirm gnome-boxes; distrobox enter archlinux -- sudo pacman -S --noconfirm gimp; distrobox enter archlinux -- sudo pacman -S --noconfirm audacity; distrobox enter archlinux -- sudo pacman -S --noconfirm vlc; distrobox enter archlinux -- sudo pacman -S --noconfirm chromium; distrobox enter archlinux -- sudo pacman -S --noconfirm transmission-gtk; distrobox enter archlinux -- sudo pacman -S --noconfirm rpi-imager; distrobox enter archlinux -- sudo pacman -S --noconfirm firefox;

##Exportação dos pacotes instalados no distrobox##
#distrobox enter archlinux -- distrobox-export --app simple-scan; distrobox enter archlinux -- distrobox-export --app kdenlive; distrobox enter archlinux -- distrobox-export --app inkscape; distrobox enter archlinux -- distrobox-export --app thunderbird; distrobox enter archlinux -- distrobox-export --app audacious; distrobox enter archlinux -- distrobox-export --app gnome-boxes; distrobox enter archlinux -- distrobox-export --app gimp; distrobox enter archlinux -- distrobox-export --app audacity; distrobox enter archlinux -- distrobox-export --app vlc; distrobox enter archlinux -- distrobox-export --app chromium; distrobox enter archlinux -- distrobox-export --app transmission-gtk; distrobox enter archlinux -- distrobox-export --app rpi-imager; distrobox enter archlinux -- distrobox-export --app firefox;

##Atualização dos pacotes archlinux instalados via distrobox##
distrobox enter archlinux -- sudo pacman -Syyuu --noconfirm;

##Instalação de programas no distrobox fedora##
#distrobox create --name fedora --image fedora:latest; distrobox enter fedora -- sudo dnf install fastfetch -y;

##Atualização dos pacotes fedora instalados via distrobox##
distrobox enter fedora -- sudo dnf5 autoremove -y; distrobox enter fedora -- sudo dnf5 makecache -y; distrobox enter fedora -- sudo dnf5 check -y; distrobox enter fedora -- sudo dnf5 check-update -y; distrobox enter fedora -- sudo dnf5 upgrade --refresh -y; distrobox enter fedora -- sudo dnf5 distro-sync -y;

##Atualização de versão##
#rpm-ostree rebase fedora:fedora/43/x86_64/kinoite;

##Instalação dos programas Flatpak##
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; flatpak install flathub com.spotify.Client -y; flatpak install flathub com.valvesoftware.Steam -y; flatpak install flathub us.zoom.Zoom -y; flatpak install flathub org.onlyoffice.desktopeditors -y; flatpak install flathub com.adobe.Flash-Player-Projector -y; flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y;

##Atualização do Flatpak##
flatpak update -y;

systemctl reboot

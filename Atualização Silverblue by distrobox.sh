#!/bin/bash

###Fedora Silverblue###
###Atualização completa do sistema###

##Execução do arquivo de atualização no terminal##
#/var/home/archlinux/Documentos/'Atualização Silverblue.sh'#

#Edição do arquivo no terminal#
#nano /var/home/archlinux/Documentos/'Atualização Silverblue.sh'#

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

#Tailscale##
#rpm-ostree install tailscale; sudo systemctl enable --now tailscaled; sudo tailscale up --ssh --accept-dns --force-reauth

##Instalação de programas no distrobox##
#distrobox create --name archlinux --image archlinux:latest; distrobox enter archlinux -- sudo pacman -S --noconfirm fastfetch; distrobox enter archlinux -- sudo pacman -S --noconfirm simple-scan; distrobox enter archlinux -- sudo pacman -S --noconfirm kdenlive; distrobox enter archlinux -- sudo pacman -S --noconfirm inkscape; distrobox enter archlinux -- sudo pacman -S --noconfirm thunderbird; distrobox enter archlinux -- sudo pacman -S --noconfirm audacious; distrobox enter archlinux -- sudo pacman -S --noconfirm gimp; distrobox enter archlinux -- sudo pacman -S --noconfirm audacity; distrobox enter archlinux -- sudo pacman -S --noconfirm vlc; distrobox enter archlinux -- sudo pacman -S --noconfirm chromium; distrobox enter archlinux -- sudo pacman -S --noconfirm transmission-gtk; distrobox enter archlinux -- sudo pacman -S --noconfirm rpi-imager; 

##Exportação dos pacotes instalados no distrobox##
#distrobox enter archlinux -- distrobox-export --app simple-scan; distrobox enter archlinux -- distrobox-export --app kdenlive; distrobox enter archlinux -- distrobox-export --app inkscape; distrobox enter archlinux -- distrobox-export --app thunderbird; distrobox enter archlinux -- distrobox-export --app audacious; distrobox enter archlinux -- distrobox-export --app gnome-boxes; distrobox enter archlinux -- distrobox-export --app gimp; distrobox enter archlinux -- distrobox-export --app audacity; distrobox enter archlinux -- distrobox-export --app vlc; distrobox enter archlinux -- distrobox-export --app chromium; distrobox enter archlinux -- distrobox-export --app transmission-gtk; distrobox enter archlinux -- distrobox-export --app rpi-imager;


##Atualização dos pacotes instalados via distrobox## 
distrobox enter archlinux -- sudo pacman -Syyuu --noconfirm;

##Não funciona no container do archlinux##
#distrobox enter archlinux -- sudo pacman -S --noconfirm gnome-firmware;


##Atualização de versão##
#rpm-ostree rebase fedora:fedora/44/x86_64/silverblue;

##Instalação dos programas Flatpak##
#flatpak install flathub com.spotify.Client -y;flatpak install flathub us.zoom.Zoom -y; flatpak install flathub org.onlyoffice.desktopeditors -y; flatpak install flathub com.adobe.Flash-Player-Projector -y; flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y; flatpak install flathub org.chromium.Chromium -y; flatpak install flathub org.fedoraproject.MediaWriter -y; flatpak install flathub org.kde.kget -y; flatpak install flathub org.videolan.VLC -y; flatpak install flathub net.mkiol.SpeechNote -y; flatpak install flathub com.saivert.pwvucontrol -y; flatpak install flathub io.github.dvlv.boxbuddyrs -y; flatpak install flathub org.telegram.desktop -y; flatpak install flathub com.obsproject.Studio -y;

##Atualização do Flatpak##
flatpak update;

systemctl reboot

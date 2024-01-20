#!/bin/bash

###Fedora Workstation###
###Atualização completa do sistema###

##Execução do arquivo de atualização no terminal##
#/home/robsonnakane/Documentos/'Atualização Workstation.sh'#

#Edição do arquivo no terminal#
#nano /home/robsonnakane/Documentos/'Atualização Workstation.sh'#

sudo dnf autoremove -y; ##remova todos os pacotes desnecessários que foram originalmente instalados como dependências
sudo dnf makecache -y; ##gera o cache de metadados
sudo dnf check -y; ##verifica se há problemas no packagedb
sudo dnf check-update -y; ##verifica se há atualizações de pacote disponíveis
sudo dnf upgrade --refresh -y; ##atualiza um ou mais pacotes em seu sistema
sudo dnf distro-sync -y; ##sincroniza os pacotes instalados com as últimas versões disponíveis
sudo grub2-mkconfig -o /boot/grub2/grub.cfg; ##Atualiza o grub

##instalação dos programas
#sudo dnf install neofetch -y; sudo dnf install simple-scan -y; sudo dnf install gnome-tweaks -y; sudo dnf install java-latest-openjdk -y; sudo dnf install btop -y; sudo dnf install kitty -y; sudo dnf install boxes -y;

##Instalação dos programas Flatpak##
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; 
#flatpak install flathub com.spotify.Client -y; flatpak install flathub org.videolan.VLC -y; flatpak install flathub com.valvesoftware.Steam -y; flatpak install flathub us.zoom.Zoom -y; flatpak install flathub org.kde.kdenlive -y; flatpak install flathub org.onlyoffice.desktopeditors -y; flatpak install flathub com.skype.Client -y; flatpak install flathub com.adobe.Flash-Player-Projector -y; flatpak install flathub org.gnome.Extensions -y; flatpak install flathub com.transmissionbt.Transmission -y; flatpak install flathub org.inkscape.Inkscape -y; flatpak install flathub org.mozilla.Thunderbird -y; flatpak install flathub org.raspberrypi.rpi-imager -y; flatpak install flathub org.fedoraproject.MediaWriter -y; flatpak install flathub org.gnome.gedit -y; flatpak install flathub com.google.Chrome -y; flatpak install flathub org.gnome.Firmware -y; flatpak install flathub org.atheme.audacious -y; flatpak install flathub ca.littlesvr.asunder -y;  flatpak install flathub ar.com.tuxguitar.TuxGuitar -y;

###Atualização de versão
##1. To update your Fedora release from the command-line do:
#sudo dnf upgrade --refresh; systemctl reboot
##2. Install the dnf-plugin-system-upgrade package if it is not currently installed: ( atualizar o releasever para a próxima versão ) 
#sudo dnf install dnf-plugin-system-upgrade; sudo dnf system-upgrade download --releasever=40; sudo dnf system-upgrade reboot
##Clean-up old packages
#sudo dnf repoquery --unsatisfied; sudo dnf repoquery --duplicates; sudo dnf remove --duplicates; systemctl reboot

##Atualização do Flatpak##
flatpak update -y;

systemctl reboot

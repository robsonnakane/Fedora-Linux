#!/bin/bash

###Fedora Workstation###
###Atualização completa do sistema###

##Execução do arquivo de atualização no terminal##
#/home/robsonnakane/Documentos/'Atualização Fedora KDE.sh'#

#Edição do arquivo no terminal#
#nano /home/robsonnakane/Documentos/'Atualização Fedora KDE.sh'#

sudo dnf autoremove -y; ##remova todos os pacotes desnecessários que foram originalmente instalados como dependências
sudo dnf makecache -y; ##gera o cache de metadados
sudo dnf check -y; ##verifica se há problemas no packagedb
sudo dnf check-update -y; ##verifica se há atualizações de pacote disponíveis
sudo dnf upgrade --refresh -y; ##atualiza um ou mais pacotes em seu sistema
sudo dnf distro-sync -y; ##sincroniza os pacotes instalados com as últimas versões disponíveis
sudo grub2-mkconfig -o /boot/grub2/grub.cfg; ##Atualiza o grub

##instalação dos programas
#sudo dnf install screenfetch -y; sudo dnf install foomatic -y; sudo dnf install simple-scan -y; sudo dnf install java-latest-openjdk -y; sudo dnf install btop -y; sudo dnf install kitty -y; sudo dnf install gnome-disks -y; sudo dnf install boxes -y;

##Instalação dos programas Flatpak##
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
#flatpak install flathub com.spotify.Client -y; flatpak install flathub org.videolan.VLC -y; flatpak install flathub com.valvesoftware.Steam -y; flatpak install flathub us.zoom.Zoom -y; flatpak install flathub org.kde.kdenlive -y; flatpak install flathub org.onlyoffice.desktopeditors -y; flatpak install flathub com.skype.Client -y; flatpak install flathub com.adobe.Flash-Player-Projector -y; flatpak install flathub com.transmissionbt.Transmission -y; flatpak install flathub org.inkscape.Inkscape -y; flatpak install flathub org.mozilla.Thunderbird -y; flatpak install flathub org.raspberrypi.rpi-imager -y; flatpak install flathub org.gnome.gedit -y; flatpak install flathub com.google.Chrome -y; flatpak install flathub org.gnome.Firmware -y; flatpak install flathub org.atheme.audacious -y; flatpak install flathub ca.littlesvr.asunder -y;  flatpak install flathub ar.com.tuxguitar.TuxGuitar -y;

##Atualização do Flatpak##
flatpak update -y;

systemctl reboot

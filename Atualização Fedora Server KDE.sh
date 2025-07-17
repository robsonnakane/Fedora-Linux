#!/bin/bash

###Fedora Server KDE###
###Atualização completa do sistema###

##Execução do arquivo de atualização no terminal##
#/home/robsonnakane/Documentos/'Atualização Fedora Server KDE.sh'#

#Edição do arquivo no terminal#
#nano /home/robsonnakane/Documentos/'Atualização Fedora Server KDE.sh'#

sudo dnf autoremove -y; ##remova todos os pacotes desnecessários que foram originalmente instalados como dependências
sudo dnf makecache -y; ##gera o cache de metadados
sudo dnf check -y; ##verifica se há problemas no packagedb
sudo dnf check-update -y; ##verifica se há atualizações de pacote disponíveis
sudo dnf upgrade --refresh -y; ##atualiza um ou mais pacotes em seu sistema
sudo dnf distro-sync -y; ##sincroniza os pacotes instalados com as últimas versões disponíveis
sudo grub2-mkconfig -o /boot/grub2/grub.cfg; ##Atualiza o grub

##instalação dos programas
sudo dnf install fastfetch -y; sudo dnf install foomatic -y; sudo dnf install java-latest-openjdk -y; sudo dnf install  gnome-disk-utility -y; sudo dnf install lshw-gui -y; sudo dnf install lsd -y;

##Instalação dos programas Flatpak##
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; flatpak install flathub com.spotify.Client -y; flatpak install flathub org.videolan.VLC -y; flatpak install flathub com.valvesoftware.Steam -y; flatpak install flathub us.zoom.Zoom -y; flatpak install flathub org.kde.kdenlive -y; flatpak install flathub org.onlyoffice.desktopeditors -y; flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y; flatpak install flathub com.adobe.Flash-Player-Projector -y; flatpak install flathub org.inkscape.Inkscape -y; flatpak install flathub org.fedoraproject.MediaWriter -y; flatpak install flathub org.chromium.Chromium -y; flatpak install flathub org.gnome.Firmware -y; flatpak install flathub org.atheme.audacious -y; flatpak install flathub org.gnome.SimpleScan -y; flatpak install flathub org.mozilla.Thunderbird -y; flatpak install flathub dev.geopjr.Collision -y; flatpak install flathub org.gnome.Boxes -y; flatpak install flathub com.transmissionbt.Transmission -y; flatpak install flathub org.videolan.VLC -y; flatpak install flathub io.github.JaGoLi.ytdl_gui -y; flatpak install flathub org.audacityteam.Audacity -y; flatpak install flathub me.kozec.syncthingtk -y; flatpak install flathub com.anydesk.Anydesk -y; flatpak install flathub net.mkiol.SpeechNote -y; flatpak install flathub io.qt.QtCreator -y; flatpak install flathub io.qt.Designer -y; flatpak install flathub io.qt.qdbusviewer -y; flatpak install flathub io.qt.Linguist -y; flatpak install flathub org.gimp.GIMP -y; flatpak install flathub org.mozilla.firefox -y;

##Atualização do Flatpak##
flatpak update -y;

##Completar o IP quando for realizar o backup
#Configuração do Firewalld: ao ativar, acrescentar a porta 22 tcp na zona / public de ambos os sistemas
#Do notebook kinoite para o desktop BigLinux
#sudo rsync -avzrp --exclude=Roberto --delete /var/mnt/dm-1/ robsonnakane@192.168.15.110:/mnt/dm-1/
#Do desktop para o notebook
#sudo rsync -avzrp robsonnakane@192.168.xx.xxx:/mnt/dm-1/ /mnt/dm-1/

systemctl reboot

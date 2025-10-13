#!/bin/bash

###Fedora Server KDE###
###Atualização completa do sistema###

##Execução do arquivo de atualização no terminal##
#/home/robsonnakane/Documentos/'Atualização Fedora Server KDE.sh'#

#Edição do arquivo no terminal#
#nano /home/robsonnakane/Documentos/'Atualização Fedora Server KDE.sh'#

sudo dnf5 autoremove -y; ##remova todos os pacotes desnecessários que foram originalmente instalados como dependências
sudo dnf5 makecache -y; ##gera o cache de metadados
sudo dnf5 check -y; ##verifica se há problemas no packagedb
sudo dnf5 check-update -y; ##verifica se há atualizações de pacote disponíveis
sudo dnf5 upgrade --refresh -y; ##atualiza um ou mais pacotes em seu sistema
sudo dnf5 distro-sync -y; ##sincroniza os pacotes instalados com as últimas versões disponíveis
sudo dnf5 system-upgrade -y; #atualiza o sistema para a versão mais nova
sudo grub2-mkconfig -o /boot/grub2/grub.cfg; ##Atualiza o grub

##Desativação de serviços para computadores fracos
#sudo systemctl stop auditd; sudo systemctl disable auditd; sudo systemctl stop systemd-oomd systemd-oomd.socket; sudo systemctl disable systemd-oomd systemd-oomd.socket; sudo systemctl stop irqbalance; sudo systemctl disable irqbalance; sudo systemctl stop fprintd; sudo systemctl disable fprintd; sudo systemctl stop bluetooth; sudo systemctl disable bluetooth; sudo systemctl stop cups; sudo systemctl disable cups; sudo systemctl stop avahi-daemon; sudo systemctl disable avahi-daemon;

##instalação dos programas
#sudo dnf install fastfetch -y; sudo dnf install foomatic -y; sudo dnf install java-latest-openjdk -y; sudo dnf install  gnome-disk-utility -y; sudo dnf install lshw-gui -y; sudo dnf install lsd -y; sudo dnf install rsync -y;

##Instalação dos programas Flatpak##
#sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
#flatpak install flathub com.spotify.Client -y; flatpak install flathub org.videolan.VLC -y; flatpak install flathub us.zoom.Zoom -y; flatpak install flathub org.kde.kdenlive -y; flatpak install flathub org.onlyoffice.desktopeditors -y; flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y; flatpak install flathub com.adobe.Flash-Player-Projector -y; flatpak install flathub org.inkscape.Inkscape -y; flatpak install flathub org.chromium.Chromium -y; flatpak install flathub org.gnome.Firmware -y; flatpak install flathub org.atheme.audacious -y; flatpak install flathub org.gnome.SimpleScan -y; flatpak install flathub org.mozilla.Thunderbird -y; flatpak install flathub dev.geopjr.Collision -y; flatpak install flathub org.gnome.Boxes -y; flatpak install flathub com.transmissionbt.Transmission -y; flatpak install flathub org.videolan.VLC -y; flatpak run me.aandrew.ytdownloader -y; flatpak install flathub org.audacityteam.Audacity -y; flatpak install flathub net.mkiol.SpeechNote -y; flatpak install flathub org.gimp.GIMP -y; flatpak install flathub org.mozilla.firefox -y; flatpak install flathub org.kde.kate -y; flatpak install flathub io.github.prateekmedia.appimagepool -y; flatpak install flathub org.kde.kget -y;

##Atualização do Flatpak##
flatpak update -y;

#Não há a necessidade de alterar o Firewall de nenhuma máquina. Apenas ativar o sshd.
#Do Notebook para Desktop
#sudo rsync -avzrp --delete /home/robsonnakane/ robsonnakane@192.168.15.110:/home/robsonnakane/
#Do Desktop para Notebook
#sudo rsync -avzrp --delete /home/robsonnakane/ robsonnakane@192.168.15.173:/home/robsonnakane/
#Do Notebook para Netbook
#sudo rsync -avzrp --delete /home/robsonnakane/ robsonnakane@192.168.15.15:/home/robsonnakane/lenovo/

systemctl reboot

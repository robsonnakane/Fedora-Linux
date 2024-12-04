#!/bin/bash

###Fedora Workstation###
###Atualização completa do sistema###

##Execução do arquivo de atualização no terminal##
#/home/robsonnakane/Documentos/'Atualização Workstation.sh'#

#Edição do arquivo no terminal#
#nano /home/robsonnakane/Documentos/'Atualização Workstation.sh'#

sudo dnf5 autoremove -y; ##remova todos os pacotes desnecessários que foram originalmente instalados como dependências
sudo dnf5 makecache -y; ##gera o cache de metadados
sudo dnf5 check -y; ##verifica se há problemas no packagedb
sudo dnf5 check-update -y; ##verifica se há atualizações de pacote disponíveis
sudo dnf5 upgrade --refresh -y; ##atualiza um ou mais pacotes em seu sistema
sudo dnf5 distro-sync -y; ##sincroniza os pacotes instalados com as últimas versões disponíveis
sudo grub2-mkconfig -o /boot/grub2/grub.cfg; ##Atualiza o grub

##instalação dos programas
#sudo dnf5 install fastfetch -y; sudo dnf5 install foomatic -y; sudo dnf5 install simple-scan -y; sudo dnf5 install gnome-tweaks -y; sudo dnf5 install java-latest-openjdk -y; sudo dnf5 install btop -y; sudo dnf5 install kitty -y; sudo dnf5 install boxes -y; sudo dnf5 install thunderbird -y; sudo dnf5 install vlc -y; sudo dnf5 install audacious -y; 

#sudo dnf5 install cockpit -y; sudo systemctl enable --now cockpit.socket; sudo firewall-cmd --add-service=cockpit; sudo firewall-cmd --add-service=cockpit --permanent;

##Instalação dos programas Flatpak##
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; sudo flatpak install flathub com.spotify.Client -y; sudo flatpak install flathub us.zoom.Zoom -y; sudo flatpak install flathub org.onlyoffice.desktopeditors -y; sudo flatpak install flathub com.skype.Client -y; sudo flatpak install flathub org.raspberrypi.rpi-imager -y; sudo flatpak install flathub org.gnome.Firmware -y; sudo flatpak install flathub org.kde.kdenlive -y; sudo flatpak install flathub org.inkscape.Inkscape -y; sudo flatpak install flathub org.fedoraproject.MediaWriter -y; sudo flatpak install flathub org.gnome.gedit -y; sudo flatpak install flathub ca.littlesvr.asunder -y; sudo flatpak install flathub ar.com.tuxguitar.TuxGuitar -y; sudo flatpak install flathub org.chromium.Chromium -y; sudo flatpak install flathub org.gnome.gitlab.YaLTeR.VideoTrimmer -y; sudo flatpak install flathub com.warlordsoftwares.media-downloader -y; sudo flatpak install flathub org.gtkhash.gtkhash -y; sudo flatpak install flathub fr.handbrake.ghb -y; sudo flatpak install flathub com.anydesk.Anydesk -y; sudo flatpak install flathub com.valvesoftware.Steam -y; sudo flatpak install flathub net.fasterland.converseen -y; sudo flatpak install flathub com.transmissionbt.Transmission -y; 

###Atualização de versão
##1. To update your Fedora release from the command-line do:
#sudo dnf5 upgrade --refresh; systemctl reboot
##2. Install the dnf5-plugin-system-upgrade package if it is not currently installed: ( atualizar o releasever para a próxima versão ) 
#sudo dnf5 install dnf5-plugin-system-upgrade; sudo dnf5 system-upgrade download --releasever=40; sudo dnf5 system-upgrade reboot
##Clean-up old packages
#sudo dnf5 repoquery --unsatisfied; sudo dnf5 repoquery --duplicates; sudo dnf5 remove --duplicates; systemctl reboot

##Atualização do Flatpak##
sudo flatpak update -y;

# Verifica se houve alguma atualização
    houve_atualizacao=$(dnf history | grep -i upgrade | wc -l)

    if [ $houve_atualizacao -gt 0 ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S") - Houve atualizações. Reiniciando o sistema." >> log.txt
        notify-send "Atualização do sistema" "O sistema será reiniciado em 30 segundos."
        sleep 30
        sudo systemctl reboot
    else
        echo "Não há atualizações disponíveis."
    fi

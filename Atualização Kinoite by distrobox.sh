#!/bin/bash

            ###Fedora Kinoite by distrobox###
            ###Atualização completa do sistema###

#sudo grub2-mkconfig -o /boot/grub2/grub.cfg; ##Atualiza o grub
rpm-ostree cancel; ##Cancela a atualização automática dos repositórios##
rpm-ostree cleanup -m; rpm-ostree cleanup -r; rpm-ostree cleanup -p; rpm-ostree cleanup -b; rpm-ostree override reset --all; ##Limpeza cache##
rpm-ostree refresh-md;##Atualizção dos repositórios##
ostree remote refs fedora;##Pesquisar a versão disponível##
rpm-ostree upgrade --preview; ##Conferência dos pacotes##
rpm-ostree upgrade; ##Atualização do sistema##

#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; ##Instalação dos pacotes Flatpak##

        ##Recomendação flatpak para Steam
#rpm-ostree install steam-devices

        ##Instalação do distrobox##
#rpm-ostree install -y distrobox podman fastfetch rsync;

        ##Criação do container toolbox##
#toolbox create --release 43;

        ###Pacotes a instalar no toolbox###
        #sudo dnf install -y gnome-boxes;

##Após o reboot##
        ##Criação dos containeres no distrobox##
        ##Debian Testing##
#distrobox create -Y --name debian --image debian:testing;
        ##Archlinux##
#distrobox create -Y --name archlinux --image archlinux:latest;
        ##Fedora##
#distrobox create -Y --name fedora --image fedora:latest;

distrobox-upgrade --all -v;

        ##Instalação dos pacotes nos containeres distrobox##
#distrobox enter archlinux -- sudo pacman -S --noconfirm fastfetch simple-scan thunderbird audacious gimp transmission-gtk rpi-imager firefox gwenview kate kdenlive yt-dlp;
#distrobox enter fedora -- sudo dnf5 install -y audacity inkscape;

        ##Exportação dos pacotes instalados no distrobox archlinux##
#distrobox enter archlinux -- distrobox-export --app simple-scan; distrobox enter archlinux -- distrobox-export --app thunderbird; distrobox enter archlinux -- distrobox-export --app audacious; distrobox enter archlinux -- distrobox-export --app gimp; distrobox enter archlinux -- distrobox-export --app transmission-gtk; distrobox enter archlinux -- distrobox-export --app rpi-imager; distrobox enter archlinux -- distrobox-export --app firefox; distrobox enter archlinux -- distrobox-export --app gwenview; distrobox enter archlinux -- distrobox-export --app kate; distrobox enter archlinux -- distrobox-export --app kdenlive;

        ##Exportação dos pacotes instalados no distrobox fedora##
#distrobox enter fedora -- distrobox-export --app audacity; distrobox enter fedora -- distrobox-export --app inkscape;

        ##Instalação do lutris dentro do terminal distrobox debian##
#echo -e "Types: deb\nURIs: https://download.opensuse.org/repositories/home:/strycore/Debian_12/\nSuites: ./\nComponents: \nSigned-By: /etc/apt/keyrings/lutris.gpg" | sudo tee /etc/apt/sources.list.d/lutris.sources > /dev/null
#wget -q -O- https://download.opensuse.org/repositories/home:/strycore/Debian_12/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/lutris.gpg
#sudo apt update;
#apt install -y lutris
#distrobox-export --app lutris


        ##Instalação dos pacotes flatpaks##
#sudo flatpak install flathub com.spotify.Client -y; sudo flatpak install flathub com.valvesoftware.Steam -y; sudo flatpak install flathub us.zoom.Zoom -y; sudo flatpak install flathub org.onlyoffice.desktopeditors -y; sudo flatpak install flathub com.adobe.Flash-Player-Projector -y; sudo flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y; sudo flatpak install flathub org.chromium.Chromium -y; sudo flatpak install flathub org.fedoraproject.MediaWriter -y; sudo flatpak install flathub org.kde.kget -y; sudo flatpak install flathub org.videolan.VLC -y; sudo flatpak install flathub net.mkiol.SpeechNote -y; flatpak install flathub com.saivert.pwvucontrol -y; flatpak install flathub io.github.dvlv.boxbuddyrs -y;

        ##Atualização do Flatpak##
flatpak update -y;

systemctl reboot

        ##Imagens do distrobox dependendo da distro##
#archlinux: docker.io/library/archlinux:latest
#fedora: registry.fedoraproject.org/fedora:latest

        ##Baixar um vídeo em melhor qualidade:##
#distrobox enter archlinux -- yt-dlp URL
        ##Baixar só áudio (MP3):
#distrobox enter archlinux -- yt-dlp -x --audio-format mp3 URL

        ##Atualização de versão##
#rpm-ostree rebase fedora:fedora/43/x86_64/kinoite;

        ##Realização de backup
#sudo rsync -avzrp --delete /home/robsonnakane/'Robson Nakane'/ robsonnakane@192.168.15.15:/home/robsonnakane/lenovo/
        ##Recuperação de backup
#sudo rsync -avzrp --delete robsonnakane@192.168.15.15:/home/robsonnakane/lenovo/ /home/robsonnakane/'Robson Nakane'/

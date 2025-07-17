#!/bin/bash

###Fedora Kinoite###
###Atualização completa do sistema###

##Execução do arquivo de atualização no terminal##
#/var/home/robsonnakane/Documentos/'Atualização Kinoite.sh'#

#Edição do arquivo no terminal#
#nano /var/home/robsonnakane/Documentos/'Atualização Kinoite.sh'#

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

##Instalação dos programas Nativos##
#rpm-ostree install fastfetch; rpm-ostree install lshw-gui; rpm-ostree install java-latest-openjdk; rpm-ostree install gnome-disk-utility; rpm-ostree install lsd; rpm-ostree install foomatic;

##Instalação dos programas Flatpak##
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo; flatpak install flathub com.spotify.Client -y; flatpak install flathub org.videolan.VLC -y; flatpak install flathub com.valvesoftware.Steam -y; flatpak install flathub us.zoom.Zoom -y; flatpak install flathub org.kde.kdenlive -y; flatpak install flathub org.onlyoffice.desktopeditors -y; flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y; flatpak install flathub com.adobe.Flash-Player-Projector -y; flatpak install flathub org.inkscape.Inkscape -y; flatpak install flathub org.fedoraproject.MediaWriter -y; flatpak install flathub org.chromium.Chromium -y; flatpak install flathub org.gnome.Firmware -y; flatpak install flathub org.atheme.audacious -y; flatpak install flathub org.gnome.SimpleScan -y; flatpak install flathub org.mozilla.Thunderbird -y; flatpak install flathub dev.geopjr.Collision -y; flatpak install flathub org.gnome.Boxes -y; flatpak install flathub com.transmissionbt.Transmission -y; flatpak install flathub org.videolan.VLC -y; flatpak install flathub io.github.JaGoLi.ytdl_gui -y; flatpak install flathub org.audacityteam.Audacity -y; flatpak install flathub me.kozec.syncthingtk -y; flatpak install flathub com.anydesk.Anydesk -y; flatpak install flathub net.mkiol.SpeechNote -y; flatpak install flathub io.qt.QtCreator -y; flatpak install flathub io.qt.Designer -y; flatpak install flathub io.qt.qdbusviewer -y; flatpak install flathub io.qt.Linguist -y; flatpak install flathub org.gimp.GIMP -y;

##Atualização do Flatpak##
flatpak update -y;

##Atualização de versão##
#rpm-ostree rebase fedora:fedora/42/x86_64/kinoite;
#rpm-ostree rebase fedora:fedora/42/x86_64/cosmic-atomic;
#rpm-ostree rebase fedora:fedora/42/x86_64/onyx;
#rpm-ostree rebase fedora:fedora/42/x86_64/silverblue;

    ###Universal Blue###
  ##Comandos para troca de interface pelo Kinoite##
##Rebase XFCE
#rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/vauxite-main:latest;

##Rebase XFCE NVIDIA
#rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/vauxite-nvidia:latest;

##Rebase Kinoite##
#rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/silverblue-main:latest;

##Rebase Kinoite NVIDIA##
#rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/silverblue-nvidia:latest;

##Rebase Gnome OS##
#rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/beyond:latest;

##Rebase Gnome OS NVIDIA##
#rpm-ostree rebase ostree-unverified-registry:ghcr.io/ublue-os/beyond-nvidia:latest;

#while true; do
#    read -p "Deseja reiniciar o computador agora? [Yy/Nn]: " yn
#    case "$yn" in
#        [Yy]* ) systemctl reboot; break;;
#        [Nn]* ) exit;;
#        * ) echo "Por favor, responda com 'Y' ou 'N'.";;
#    esac
#done

systemctl reboot

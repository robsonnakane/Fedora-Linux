#!/bin/bash

###Fedora Workstation###
###Atualização completa do sistema###

##Execução do arquivo de atualização no terminal##
#/home/robsonnakane/Documentos/'Atualização Workstation by AI.sh'#

#Edição do arquivo no terminal#
#nano /home/robsonnakane/Documentos/'Atualização Workstation.sh'#

# Funções para organizar o código
function instalar_pacotes() {
  sudo dnf5 install -y "$@"
}

function atualizar_sistema() {
  sudo dnf5 upgrade --refresh -y
  sudo dnf5 distro-sync -y
  sudo grub2-mkconfig -o /boot/grub2/grub.cfg
}

function instalar_flatpak() {
  sudo flatpak install flathub -y "$@"
}

function atualizar_flatpak() {
  sudo flatpak update -y
}

function verificar_atualizacoes() {
  houve_atualizacao=$(dnf history | grep -i upgrade | wc -l)
  if [ $houve_atualizacao -gt 0 ]; then
    echo "$(date +"%Y-%m-%d %H:%M:%S") - Houve atualizações. Reiniciando o sistema." >> log.txt
    notify-send "Atualização do sistema" "O sistema será reiniciado em 30 segundos."
    sleep 30
    sudo systemctl reboot
  else
    which foobar
    echo "Não há atualizações disponíveis."
  fi
}

# Configurações personalizáveis
pacotes_a_instalar=("fastfetch" "foomatic" "simple-scan" "gnome-tweaks" "java-latest-openjdk" "btop" "kitty" "boxes" "thunderbird" "vlc" "audacious" "steam-devices")
# Adicione os IDs dos pacotes Flatpak aqui
pacotes_flatpak=("com.spotify.Client" "us.zoom.Zoom" "org.onlyoffice.desktopeditors" "com.skype.Client" "org.raspberrypi.rpi-imager" "org.gnome.Firmware" "org.kde.kdenlive" "org.inkscape.Inkscape" "org.fedoraproject.MediaWriter" "org.gnome.gedit" "ca.littlesvr.asunder" "ar.com.tuxguitar.TuxGuitar" "org.chromium.Chromium" "org.gnome.gitlab.YaLTeR.VideoTrimmer" "com.warlordsoftwares.media-downloader" "org.gtkhash.gtkhash" "fr.handbrake.ghb" "com.anydesk.Anydesk" "com.valvesoftware.Steam" "net.fasterland.converseen" "com.transmissionbt.Transmission") 
# Alterar para a versão desejada
versao_fedora_destino=41
arquivo_log="atualizacoes.log"

# Instalar pacotes
instalar_pacotes "${pacotes_a_instalar[@]}"

# Instalar pacotes
instalar_flatpak "${pacotes_flatpak[@]}"

# Atualizar o sistema
atualizar_sistema

# Atualizar pacotes Flatpak
atualizar_flatpak

# Verificar se houve atualizações e reiniciar o sistema
verificar_atualizacoes

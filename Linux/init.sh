#!/bin/bash
# run script with `bash init.sh`

# Update package manager apt and upgrade system 
sudo apt update
sudo apt full-upgrade --yes
# autoremove unnötig

# Update package manager apt-get and upgrade system 
sudo apt-get update
sudo apt-get dist-upgrade --yes

# Installing Software
# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl is not installed. Installing curl..."
    sudo apt install -y curl
fi

# Zielverzeichnis für den Download
#zielverzeichnis="$HOME/Schreibtisch"
zielverzeichnis="$HOME/$(xdg-user-dir DESKTOP)"

# URL des Skripts
skript_url="https://raw.githubusercontent.com/Tony-Klein/pub/main/Linux/setup.sh"

# Dateiname des heruntergeladenen Skripts
skript_dateiname="setup.sh"

# Herunterladen des Skripts
echo "Herunterladen des Skripts..."
curl -o "$zielverzeichnis/$skript_dateiname" "$skript_url"

# Ausführen von setup.sh
bash $zielverzeichnis/setup.sh

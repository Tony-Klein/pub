#!/bin/bash
# run script with `bash init.sh`

# Update package manager apt and upgrade system 
sudo apt update
sudo apt full-upgrade --yes
# autoremove unnötig

# Update package manager apt-get and upgrade system 
sudo apt-get update
sudo apt-get dist-upgrade --yes

read -rp "Starting Installation of curl. Do you want to continue? (Y/n) " confirmation

# Installing Software
# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl is not installed. Installing curl..."
    sudo apt install -y curl
fi

echo "Installation von curl abgeschlossen."

# Zielverzeichnis für den Download
#zielverzeichnis="$HOME/Schreibtisch"
zielverzeichnis="$HOME/$(xdg-user-dir DESKTOP)"

# URL des Skripts
skript_url="https://raw.githubusercontent.com/Tony-Klein/pub/main/Linux/setup.sh"

# Dateiname des heruntergeladenen Skripts
skript_dateiname="setup.sh"

echo "Url gesetzt auf $skript_url"
echo "Datei gesetzt auf $skript_dateiname"
echo "Curl Befehl gesetzt auf curl -o $zielverzeichnis/$skript_dateiname $skript_url"

read -rp "Downloading > setup.sh <. Do you want to continue? (Y/n) " confirmation

# Herunterladen des Skripts
echo "Herunterladen des Skripts..."
curl -o "$zielverzeichnis/$skript_dateiname" "$skript_url"

echo "Herunterladen des Skripts abgeschlossen."

# Ausführen von setup.sh
#bash "$zielverzeichnis/setup.sh"

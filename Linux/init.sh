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
else echo "Keine Installation von curl nötig."

fi


# Zielverzeichnis für den Download
#zielverzeichnis="$HOME/Schreibtisch"
zielverzeichnis="$(xdg-user-dir DESKTOP)"
echo "Zielverzeichnis: $zielverzeichnis"

read -rp "Zielverzeichnis saved. Do you want to continue? (Y/n) " confirmation

# URL des Skripts
skript_url="https://raw.githubusercontent.com/Tony-Klein/pub/main/Linux/setup.sh"

# Dateiname des heruntergeladenen Skripts
skript_dateiname="setup.sh"

echo "Url: $skript_url"
echo "Filename: $skript_dateiname"

read -rp "Downloading > $skript_url <. Do you want to continue? (Y/n) " confirmation

# Herunterladen des Skripts
echo "Herunterladen des Skripts..."
curl -o "$zielverzeichnis/$skript_dateiname" "$skript_url"

echo "Herunterladen des Skripts abgeschlossen."

# Ausführen von setup.sh
#bash "$zielverzeichnis/setup.sh"

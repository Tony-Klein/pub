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
zielverzeichnis="$HOME/Schreibtisch"

# URL des Skripts
skript_url="https://github.com/Tony-Klein/pub/blob/main/setup.sh"

# Dateiname des heruntergeladenen Skripts
skript_dateiname="setup.sh"

# Herunterladen des Skripts
echo "Herunterladen des Skripts..."
curl -o "$zielverzeichnis/$skript_dateiname" "$skript_url"

# Überprüfen, ob der Download erfolgreich war
if [ $? -eq 0 ]; then
    echo "Der Download des Skripts war erfolgreich."

    # Ausführbare Berechtigungen für das Skript setzen
    chmod +x "$zielverzeichnis/$skript_dateiname"

    # Ausführen des Skripts
    echo "Ausführen des Skripts..."
    "$zielverzeichnis/$skript_dateiname"
else
    echo "Der Download des Skripts ist fehlgeschlagen."
fi

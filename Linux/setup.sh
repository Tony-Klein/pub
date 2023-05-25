#!/bin/bash

# Update package manager apt and upgrade system 
sudo apt update
sudo apt full-upgrade --yes
# autoremove unnötig

# Update package manager apt-get and upgrade system 
sudo apt-get update
sudo apt-get dist-upgrade --yes

read -rp "Updates successfully installed. Do you want to continue? (Y/n) " confirmation

# Installing Software

## https://wiki.ubuntuusers.de/Python/
sudo apt-get install python3 --yes
## sudo apt-get install python-is-python3 --yes

read -rp "python3 successfully installed. Do you want to continue? (Y/n) " confirmation

## https://packages.debian.org/search?keywords=python3-dev
sudo apt install python3-dev --yes

read -rp "python3-dev successfully installed. Do you want to continue? (Y/n) " confirmation

## https://wiki.ubuntuusers.de/pip/
sudo apt-get install python3-pip --yes
## python3 -m pip [OPTION(EN)] BEFEHL MODUL(E) 
## python3 -m pip -r requirements.txt

read -rp "python3-pip successfully installed. Do you want to continue? (Y/n) " confirmation

## https://askubuntu.com/questions/1372562/how-to-install-libpq-dev-14-0-1-on-ubuntu-21-10
## sudo apt-get install libpq-dev --yes

## https://git-scm.com/download/linux
sudo add-apt-repository ppa:git-core/ppa 
sudo apt update
sudo apt install git --yes

echo "git successfully installed."

## https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
#sudo apt-get install git-all --yes

# Prompt for user name in GitHub
read -p "Enter your name for GitHub: " username

# Prompt for user email in GitHub
read -p "Enter your email for GitHub: " email

read -s -p "Enter your personal access token for GitHub: " persacctoken

# Set git config with the entered values
git config --global user.name "$username"
git config --global user.email "$email"
git config --global credential.helper store
git config --global user.password "$persacctoken"

read -rp "git successfully configured. Do you want to continue? (Y/n) " confirmation

## https://wiki.ubuntuusers.de/venv/
sudo apt-get install python3-venv --yes

read -rp "python3-venv successfully installed. Do you want to continue? (Y/n) " confirmation

### Anlegen einer virtuellen Umgebung:
### python3 -m venv /home/BENUTZER/venv-test

### Aktivieren der virtuellen Ungebung:
### source /home/BENUTZER/venv-test/bin/activate 

### Deinstallieren der virtuellen Umgebung:
### Löschen des für die virtuelle Umgebung angelegte Verzeichnisses inklusive Unterverzeichnissen (.venv Folder)

# Update package manager apt and upgrade system 
sudo apt update
sudo apt full-upgrade --yes

# Update package manager apt-get and upgrade system 
sudo apt-get update
sudo apt-get dist-upgrade --yes

read -rp "Updates successfully installed. Do you want to continue? (Y/n) " confirmation

## Install Visual Studion Code
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https --yes
sudo apt update
sudo apt install code --yes # or code-insiders

read -rp "VS Code successfully installed. Do you want to continue? (Y/n) " confirmation

## Create Git/NewProject

#!/bin/bash

# Prompt for project name
read -p "Enter your project name: " newproject

# Create project directory
mkdir -p ~/Git/"$newproject"

read -rp "~/Git/$newproject successfully created. Do you want to continue? (Y/n) " confirmation

# Perform actions within the project directory
# Add any additional commands or instructions here

# Example: Create a README file
echo "This is a new project" > README.md


# Example: Create a requirements.txt file
echo "Creating a new requirements.txt"

# Prompt for content of requirements.txt
echo "Enter the content for requirements.txt line by line (enter 'done' to finish):"

requirements_content=""
while true; do
    read -r line
    if [[ $line == "done" ]]; then
        break
    fi
    requirements_content+="$line"$'\n'
done

# Create requirements.txt file with user-defined content
echo "$requirements_content" > ~/Git/"$newproject"/requirements.txt

# Display confirmation message
read -rp "> requirements.txt < successfully created. Do you want to continue? (Y/n) " confirmation

## Create Virtual Environment
python3 -m venv ~/Git/"$newproject"/.venv

echo "Virtual Environment successfully created."
read -rp "End of Script. Do you want to activate Virtual Environment now? (Y/n) " confirmation

# Activate Virtual Environment and execute subsequent commands within it
(
    source /home/tonyklein/Git/test/.venv/bin/activate
    ~/Git/"$newproject"/.venv/bin/activate
    
    ## Install all necessary pip packages within requirements.txt
    pip install -r requirements.txt
)

#!/bin/bash

# Function to prompt before executing a command
function prompt_execute() {
    read -p "Do you want to execute: $1? (y/n): " answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
        eval "$1"
    else
        echo "Skipping..."
    fi
}

# Installation
prompt_execute "su -"
prompt_execute "apt-get update -y"
prompt_execute "apt-get upgrade -y"
prompt_execute "apt install sudo"

# Adding user to sudo group
prompt_execute "su -"
prompt_execute "usermod -aG sudo your_username"

# Installing tools
prompt_execute "apt-get update -y"
prompt_execute "apt-get upgrade -y"
prompt_execute "apt-get install git -y"
prompt_execute "git --version"

prompt_execute "apt-get install wget"
prompt_execute "apt-get install vim"
prompt_execute "sh -c \"\$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)\""

# Installing SSH and configuring SSH service
prompt_execute "sudo apt-get update"
prompt_execute "sudo apt install openssh-server"
prompt_execute "sudo systemctl status ssh"
prompt_execute "sudo service ssh restart"
prompt_execute "sudo nano /etc/ssh/sshd_config"
# Change Port22 to Port 4242
# Restart SSH service
prompt_execute "sudo service ssh restart"

# Installing and configuring UFW
prompt_execute "apt-get install ufw"
prompt_execute "sudo ufw enable"
prompt_execute "sudo ufw status numbered"
prompt_execute "sudo ufw allow ssh"
prompt_execute "sudo ufw allow 4242"
prompt_execute "sudo ufw status numbered"
# Delete the new rule: (This is for when you defend your Born2beroot)

# Connecting SSH server
# Add forward rule for VirtualBox
# Restart SSH server
# Check ssh status

# Set password policy
prompt_execute "sudo apt-get install libpam-pwquality"
prompt_execute "sudo nano /etc/pam.d/common-password"
# Modify password policy
prompt_execute "sudo nano /etc/login.defs"
# Modify password expiration

# Create group
prompt_execute "sudo groupadd user42"
prompt_execute "sudo groupadd evaluating"
prompt_execute "getent group"

# Create user and assign into group
prompt_execute "cut -d: -f1 /etc/passwd"
prompt_execute "sudo adduser new_username"
prompt_execute "sudo usermod -aG user42 your_username"
prompt_execute "sudo usermod -aG evaluating your_new_username"
prompt_execute "getent group user42"
prompt_execute "getent group evaluating"
prompt_execute "groups"
prompt_execute "chage -l your_new_username"

# Configuring sudoers group
prompt_execute "sudo nano /etc/sudoers"
# Add sudoers configuration

# Change hostname
prompt_execute "hostnamectl"
prompt_execute "hostnamectl set-hostname new_hostname"
prompt_execute "sudo nano /etc/hosts"
# Change old_hostname with new_hostname
prompt_execute "sudo reboot"

# Crontab configuration
# Install netstat tools
prompt_execute "sudo apt-get update -y"
prompt_execute "sudo apt-get install -y net-tools"
# Place monitoring.sh in /usr/local/bin/
# Add rule for sudo passwordless execution of monitoring.sh
# Reboot
# Execute the script as su
# Open crontab and add the rule

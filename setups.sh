#!/bin/bash

# Installation
su -
apt-get update -y
apt-get upgrade -y
apt install sudo

# Adding user to sudo group
su -
usermod -aG sudo your_username

# Installing tools
apt-get update -y
apt-get upgrade -y
apt-get install git -y
git --version

apt-get install wget
apt-get install vim
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Installing SSH and configuring SSH service
sudo apt-get update
sudo apt install openssh-server
sudo systemctl status ssh
sudo service ssh restart
sudo nano /etc/ssh/sshd_config
# Change Port22 to Port 4242
# Restart SSH service
sudo service ssh restart

# Installing and configuring UFW
apt-get install ufw
sudo ufw enable
sudo ufw status numbered
sudo ufw allow ssh
sudo ufw allow 4242
sudo ufw status numbered
# Delete the new rule: (This is for when you defend your Born2beroot)

# Connecting SSH server
# Add forward rule for VirtualBox
# Restart SSH server
# Check ssh status

# Set password policy
sudo apt-get install libpam-pwquality
sudo nano /etc/pam.d/common-password
# Modify password policy
sudo nano /etc/login.defs
# Modify password expiration

# Create group
sudo groupadd user42
sudo groupadd evaluating
getent group

# Create user and assign into group
cut -d: -f1 /etc/passwd
sudo adduser new_username
sudo usermod -aG user42 your_username
sudo usermod -aG evaluating your_new_username
getent group user42
getent group evaluating
groups
chage -l your_new_username

# Configuring sudoers group
sudo nano /etc/sudoers
# Add sudoers configuration

# Change hostname
hostnamectl
hostnamectl set-hostname new_hostname
sudo nano /etc/hosts
# Change old_hostname with new_hostname
sudo reboot

# Crontab configuration
# Install netstat tools
sudo apt-get update -y
sudo apt-get install -y net-tools
# Place monitoring.sh in /usr/local/bin/
# Add rule for sudo passwordless execution of monitoring.sh
# Reboot
# Execute the script as su
# Open crontab and add the rule

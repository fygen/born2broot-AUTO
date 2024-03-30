#!/bin/bash

# Configs folder
configsFolder=/configsPre/

# Color Settings
source $configsFolder/colors.sh

# Function to prompt user for input
prompt_user() {
    read -p "$1" input
    echo "$input"
}

# Function to prompt if wanted before executing a command
function prompt_execute() {
    read -p "Do you want to execute: $1? (y/n): " answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
        eval "$1"
    else
        echo "Skipping..."
    fi
}

# Function to prompt if somethings done before executing a command
prompt_execute_if() {
    echo -en "$1"
    read answer
    if [ "$answer" != "${answer#[Yy]}" ]; then
        eval "$2"
    else
        echo "$1"
        eval_if_exists "$3"
    fi
} 

# If another way has given then evaluate it 
function eval_if_exists() {
    if [ -n "$1" ]; then
        eval "$1"
    fi
}

# SOME CODEBLOCKS FOR SETTING TOGETHER
set_sudo() {
    sudo addgroup user42
    player=$(who | cut -d ' ' -f1)
    sudo usermod -aG sudo $player
    sudo usermod -aG user42 $player
}

reset_sudo() {
    sudo delgroup user42
    player=$(who | cut -d ' ' -f1)
}

    # sudo usermod -aG $player sudo
create_user() {
    read -p "Create a user with your 42 schools login:" login
    # sudo adduser $login
    echo "NOT IMPLEMENTED YET: CONTACT FYGEN FOR IMPLEMENTATION"
}

# Installation
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install sudo -y

# Adding user to sudo group
player=$(who | cut -d ' ' -f1)
prompt_execute_if "Is this your 42 username: ${Red}${On_White}$player${Color_Off}?(y/n)" "set_sudo" "create_user"

# Install tools
sudo apt-get install git wget 
prompt_execute "sudo apt-get install vim -y"
sudo apt install zsh -y
if [ ! -d "/home/ayegen/.oh-my-zsh" ]; then
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" --skip-chsh
fi
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="bira"/' /home/$player/.zshrc

# Installing SSH and configuring SSH service
sudo apt-get install openssh-server -y
sudo systemctl status ssh

sudo service ssh stop
sudo sed -i 's/#Port 22/Port 4242/' /etc/ssh/sshd_config
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo service ssh start

# Installing and configuring UFW
sudo apt-get install ufw -y
sudo ufw enable

sudo ufw status numbered | awk '/22/{print $2}' | cut -d] -f 1
echo y | sudo ufw delete $(sudo ufw status numbered | awk '/22/{print $2}' | cut -d] -f 1) 
echo y | sudo ufw delete $(sudo ufw status numbered | awk '/22/{print $2}' | cut -d] -f 1) 
sudo ufw allow 4242

# Set password policy
sudo apt-get install libpam-pwquality -y

sudo sed -i 's/password \[success=2 default=ignore\] pam_unix.so obscure sha512/password [success=2 default=ignore] pam_unix.so obscure sha512 minlen=10/' /etc/pam.d/common-password
sudo sed -i 's/pam_pwquality.so retry=3/pam_pwquality.so retry=3 minlen=10 ucredit=-1 dcredit=-1 lcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root/' /etc/pam.d/common-password
sudo sed -i 's/PASS_MAX_DAYS\t9999/PASS_MAX_DAYS 30/' /etc/login.defs
sudo sed -i 's/PASS_MIN_DAYS\t0/PASS_MIN_DAYS 2/' /etc/login.defs
sudo sed -i 's/PASS_WARN_AGE\t7/PASS_WARN_AGE 7/' /etc/login.defs

# # Create groups
# group_name1=$(prompt_user "Enter the name for the first group: ")
# group_name2=$(prompt_user "Enter the name for the second group: ")
# sudo groupadd $group_name1
# sudo groupadd $group_name2

# # Create user and assign into group
# sudo adduser new_username
# sudo usermod -aG $group_name1 $your_username
sudo usermod -aG $group_name2 new_username

# Configuring sudoers group
echo "$player ALL=(ALL) NOPASSWD: /usr/local/bin/monitoring.sh" | sudo tee -a /etc/sudoers

# # Change hostname
# new_hostname=$(prompt_user "Enter the new hostname: ")
# sudo hostnamectl set-hostname $new_hostname
# sudo sed -i "s/127.0.1.1.*/127.0.1.1\t$new_hostname/" /etc/hosts

# # Crontab configuration
# sudo apt-get install -y net-tools
# sudo tee /usr/local/bin/monitoring.sh > /dev/null <<'EOF'
# #!/bin/bash
# wall $'#Architecture: ' \$(hostnamectl | grep "Operating System" | cut -d ' ' -f5- ) \$(awk -F':' '/^model name/ {print \$2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//') \$(arch) \
# $'\n#CPU physical: '\$(cat /proc/cpuinfo | grep processor | wc -l) \
# $'\n#vCPU:  '\$(cat /proc/cpuinfo | grep processor | wc -l) \
# $'\n'\$(free -m | awk 'NR==2{printf "#Memory Usage: %s/%sMB (%.2f%%)", \$3,\$2,\$3*100/\$2 }') \
# $'\n'\$(df -h | awk '\$NF=="/"{printf "#Disk Usage: %d/%dGB (%s)", \$3,\$2,\$5}') \
# $'\n'\$(top -bn1 | grep load | awk '{printf "#CPU Load: %.2f\n", \$(NF-2)}') \
# $'\n#Last boot: ' \$(who -b | awk '{print \$3" "\$4" "\$5}') \
# $'\n#LVM use: ' \$(lsblk |grep lvm | awk '{if (\$1) {print "yes";exit;} else {print "no"} }') \
# $'\n#Connection TCP:' \$(netstat -an | grep ESTABLISHED |  wc -l) \
# $'\n#User log: ' \$(who | cut -d " " -f 1 | sort -u | wc -l) \
# $'\nNetwork: IP ' \$(hostname -I)"("\$(ip a | grep link/ether | awk '{print \$2}')")" \
# $'\n#Sudo:  ' \$(grep 'sudo ' /var/log/auth.log | wc -l)
# EOF

# # Making monitoring.sh executable
# sudo chmod +x /usr/local/bin/monitoring.sh


# Install necessary tools
sudo apt-get install -y net-tools
sudo cp monitoring.sh /usr/local/bin/monitoring.sh

# Make monitoring.sh executable
sudo chmod +x /usr/local/bin/monitoring.sh

# Add cron job
(crontab -l ; echo "0 * * * * /usr/local/bin/monitoring.sh") | crontab -

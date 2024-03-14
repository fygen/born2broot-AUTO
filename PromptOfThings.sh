#!/bin/bash

# Function to prompt user for input
prompt_user() {
    read -p "$1" input
    echo "$input"
}

# Installation
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install sudo -y

# Adding user to sudo group
your_username=$(prompt_user "Enter your username: ")
sudo usermod -aG sudo $your_username

# Installing tools
sudo apt-get install git wget vim -y
git --version

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Installing SSH and configuring SSH service
sudo apt-get install openssh-server -y
sudo systemctl status ssh
sudo service ssh restart
sudo sed -i 's/#Port 22/Port 4242/' /etc/ssh/sshd_config
sudo service ssh restart

# Installing and configuring UFW
sudo apt-get install ufw -y
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 4242

# Set password policy
sudo apt-get install libpam-pwquality -y
sudo sed -i 's/password \[success=2 default=ignore\] pam_unix.so obscure sha512/password [success=2 default=ignore] pam_unix.so obscure sha512 minlen=10/' /etc/pam.d/common-password
sudo sed -i 's/password    requisite         pam_pwquality.so retry=3/password    requisite         pam_pwquality.so retry=3 lcredit =-1 ucredit=-1 dcredit=-1 maxrepeat=3 usercheck=0 difok=7 enforce_for_root/' /etc/pam.d/common-password
sudo sed -i 's/PASS_MAX_DAYS 9999/PASS_MAX_DAYS 30/' /etc/login.defs
sudo sed -i 's/PASS_MIN_DAYS 0/PASS_MIN_DAYS 2/' /etc/login.defs
sudo sed -i 's/PASS_WARN_AGE 7/PASS_WARN_AGE 7/' /etc/login.defs

# Create groups
group_name1=$(prompt_user "Enter the name for the first group: ")
group_name2=$(prompt_user "Enter the name for the second group: ")
sudo groupadd $group_name1
sudo groupadd $group_name2

# Create user and assign into group
sudo adduser new_username
sudo usermod -aG $group_name1 $your_username
sudo usermod -aG $group_name2 new_username

# Configuring sudoers group
echo "$your_username ALL=(ALL) NOPASSWD: /usr/local/bin/monitoring.sh" | sudo tee -a /etc/sudoers

# Change hostname
new_hostname=$(prompt_user "Enter the new hostname: ")
sudo hostnamectl set-hostname $new_hostname
sudo sed -i "s/127.0.1.1.*/127.0.1.1\t$new_hostname/" /etc/hosts
sudo reboot

# Crontab configuration
sudo apt-get install -y net-tools
sudo tee /usr/local/bin/monitoring.sh > /dev/null <<'EOF'
#!/bin/bash
wall $'#Architecture: ' \$(hostnamectl | grep "Operating System" | cut -d ' ' -f5- ) \$(awk -F':' '/^model name/ {print \$2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//') \$(arch) \
$'\n#CPU physical: '\$(cat /proc/cpuinfo | grep processor | wc -l) \
$'\n#vCPU:  '\$(cat /proc/cpuinfo | grep processor | wc -l) \
$'\n'\$(free -m | awk 'NR==2{printf "#Memory Usage: %s/%sMB (%.2f%%)", \$3,\$2,\$3*100/\$2 }') \
$'\n'\$(df -h | awk '\$NF=="/"{printf "#Disk Usage: %d/%dGB (%s)", \$3,\$2,\$5}') \
$'\n'\$(top -bn1 | grep load | awk '{printf "#CPU Load: %.2f\n", \$(NF-2)}') \
$'\n#Last boot: ' \$(who -b | awk '{print \$3" "\$4" "\$5}') \
$'\n#LVM use: ' \$(lsblk |grep lvm | awk '{if (\$1) {print "yes";exit;} else {print "no"} }') \
$'\n#Connection TCP:' \$(netstat -an | grep ESTABLISHED |  wc -l) \
$'\n#User log: ' \$(who | cut -d " " -f 1 | sort -u | wc -l) \
$'\nNetwork: IP ' \$(hostname -I)"("\$(ip a | grep link/ether | awk '{print \$2}')")" \
$'\n#Sudo:  ' \$(grep 'sudo ' /var/log/auth.log | wc -l)
EOF

# Making monitoring.sh executable
sudo chmod +x /usr/local/bin/monitoring.sh

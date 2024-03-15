#!/bin/bash

# Configuration for /etc/sudoers
echo 'Defaults     secure_path="..."' | sudo tee -a /etc/sudoers
echo 'Defaults     passwd_tries=3' | sudo tee -a /etc/sudoers
echo 'Defaults     badpass_message="Password is wrong, please try again!"' | sudo tee -a /etc/sudoers
echo 'Defaults     logfile="/var/log/sudo/sudo.log"' | sudo tee -a /etc/sudoers
echo 'Defaults     log_input,log_output' | sudo tee -a /etc/sudoers
echo 'Defaults     requiretty' | sudo tee -a /etc/sudoers
echo 'your_username ALL=(ALL) NOPASSWD: /usr/local/bin/monitoring.sh' | sudo tee -a /etc/sudoers

# Configuration for /etc/pam.d/common-password
sudo sed -i 's/password \[success=2 default=ignore\] pam_unix.so obscure sha512/password [success=2 default=ignore] pam_unix.so obscure sha512 minlen=10/' /etc/pam.d/common-password
sudo sed -i 's/password    requisite         pam_pwquality.so retry=3/password    requisite         pam_pwquality.so retry=3 lcredit =-1 ucredit=-1 dcredit=-1 maxrepeat=3 usercheck=0 difok=7 enforce_for_root/' /etc/pam.d/common-password

# Configuration for /etc/login.defs
sudo sed -i 's/PASS_MAX_DAYS 9999/PASS_MAX_DAYS 30/' /etc/login.defs
sudo sed -i 's/PASS_MIN_DAYS 0/PASS_MIN_DAYS 2/' /etc/login.defs
sudo sed -i 's/PASS_WARN_AGE 7/PASS_WARN_AGE 7/' /etc/login.defs

# Configuration for /etc/ssh/sshd_config
sudo sed -i 's/#Port 22/Port 4242/' /etc/ssh/sshd_config

# Configuration for /usr/local/bin/monitoring.sh
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

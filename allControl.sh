sudo visudo
nano /var/log/sudo/sudo.log
nano /etc/ssh/sshd_config
sudo ufw status numbered
sudo nano /etc/pam.d/common-password
sudo nano /etc/login.defs
chage -l root
chage -l $(who | cut -d ' ' -f1)
nano /usr/local/bin/monitoring.sh
sudo crontab -u root -e
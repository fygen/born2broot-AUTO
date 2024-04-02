user=$(who | cut -d ' ' -f1 | awk 'NR==1' )
sudo visudo
nano /var/log/sudo/sudo.log
nano /etc/ssh/sshd_config
sudo ufw status numbered
sudo nano /etc/pam.d/common-password
sudo nano /etc/login.defs
sudo chage -l root
chage -l $user
nano /usr/local/bin/monitoring.sh
sudo crontab -u root -e
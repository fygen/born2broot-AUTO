cp monitoring.sh /usr/local/bin/monitoring.sh
chmod 777 /usr/local/bin/monitoring.sh
# Access the VM by Ubuntu terminal
# Change the monitoring.sh file
nano /usr/local/bin/monitoring.sh
sudo visudo
echo "$user ALL=(ALL) NOPASSWD: /usr/local/bin/monitoring.sh" >> /etc/sudoers
sudo /usr/local/bin/monitoring.sh
# At the file end: */10 * * * * /usr/local/bin/monitoring.sh
sudo crontab -u root -e
sudo reboot
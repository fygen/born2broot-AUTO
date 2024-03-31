user=$(who | cut -d ' ' -f1)
cp monitoring.sh /usr/local/bin/monitoring.sh
chmod 777 /usr/local/bin/monitoring.sh
# Access the VM by Ubuntu terminal
# Change the monitoring.sh file
nano /usr/local/bin/monitoring.sh
echo "$user ALL=(ALL) NOPASSWD: /usr/local/bin/monitoring.sh" >> /etc/sudoers
sudo visudo
# At the file end: */10 * * * * /usr/local/bin/monitoring.sh
sudo /usr/local/bin/monitoring.sh
sudo crontab -u root -e
sudo reboot
user=$(who | cut -d ' ' -f1) 
sudo adduser $user sudo 
echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/README 
